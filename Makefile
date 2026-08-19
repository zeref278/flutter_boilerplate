.PHONY: setup generate clean_gen rename flavorize analyze test coverage clean \
	$(ENV_TARGETS) $(RUN_TARGETS) $(APK_TARGETS) $(BUNDLE_TARGETS)

# FVM is used when it is installed, and ignored when it is not. Nothing here
# requires it: `make setup` works against whatever `flutter` is on PATH, and
# `pubspec.yaml` states the SDK range it needs, so a too-old toolchain fails
# at `pub get` with a message naming the version rather than something
# obscure later. `.fvmrc` records the version this project is developed
# against, for anyone who does want the pin.
#
# Override either one explicitly to force a toolchain:
#   make test FLUTTER=/path/to/flutter DART=/path/to/dart
FVM := $(shell command -v fvm 2>/dev/null)
ifdef FVM
  FLUTTER ?= fvm flutter
  DART ?= fvm dart
else
  FLUTTER ?= flutter
  DART ?= dart
endif
COVERAGE_DEVICE ?=
COVERAGE_MINIMUM ?= 80
# The device leg of the coverage run needs a flavor: once product flavors
# exist there is no plain Debug configuration left to build, on either
# platform. dev is the flavor whose .env `make setup` already baked.
COVERAGE_FLAVOR ?= dev

# One name per flavor, matching `.env.<flavor>`, `flavorizr.yaml`, and
# `AppFlavor`. Adding a flavor means adding it in all four places.
FLAVORS := dev production

ENV_TARGETS    := $(FLAVORS:%=env_%)
RUN_TARGETS    := $(FLAVORS:%=run_%)
APK_TARGETS    := $(FLAVORS:%=build_apk_%)
BUNDLE_TARGETS := $(FLAVORS:%=build_appbundle_%)

setup: ## Install dependencies and run all code generation
	$(FLUTTER) pub get
	$(MAKE) generate

generate: ## Run code generation (l10n, then build_runner) for the dev env
	$(FLUTTER) gen-l10n
	$(DART) run build_runner build

# --- Configuration ------------------------------------------------------------

# Bake one flavor's .env into env.g.dart. The --define overrides the envied
# path (enabled by `override: true` in build.yaml), so ONLY this flavor's
# values reach the binary. Must run before any run or build of that flavor;
# the run_ and build_ targets below depend on it so that cannot be forgotten.
#
# build_runner keys its cache on the path, not the file contents, so editing a
# .env in place and rebuilding the same flavor can reuse a stale result. Run
# `make clean_gen` when a value looks wrong.
$(ENV_TARGETS): env_%:
	$(DART) run build_runner build --define=envied_generator:envied=path=.env.$*

clean_gen: ## Discard the build_runner cache, then regenerate
	$(DART) run build_runner clean
	$(DART) run build_runner build

# --- Making this yours ------------------------------------------------------

# Rename the project in one pass: pubspec, every Dart import, the Android
# namespace/applicationId and Kotlin package, and flavorizr.yaml. Then
# flavorize, which is what rewrites the iOS bundle identifiers.
#
#   make rename NAME=acme_wallet ORG=com.acme DISPLAY="Acme Wallet"
#
# DISPLAY is optional and defaults to a title-cased NAME.
rename: ## Rename the project (NAME=, ORG=, optional DISPLAY=)
	@test -n "$(NAME)" || (echo "NAME is required, e.g. NAME=acme_wallet" >&2; exit 2)
	@test -n "$(ORG)" || (echo "ORG is required, e.g. ORG=com.acme" >&2; exit 2)
	$(DART) run tool/rename.dart --name=$(NAME) --org=$(ORG) $(if $(DISPLAY),--display="$(DISPLAY)",)
	$(MAKE) flavorize
	$(FLUTTER) pub get

flavorize: ## Regenerate the native flavor scaffolding (rewrites android/, ios/)
	$(DART) run flutter_flavorizr

# --- Run and build ------------------------------------------------------------

$(RUN_TARGETS): run_%: env_%
	$(FLUTTER) run --flavor $*

# --obfuscate renames Dart symbols in libapp.so; --split-debug-info emits the
# map needed to read a crash report back. Keep that output out of version
# control and archive it per release.
$(APK_TARGETS): build_apk_%: env_%
	$(FLUTTER) build apk --flavor $* \
		--obfuscate --split-debug-info=build/symbols/$*

$(BUNDLE_TARGETS): build_appbundle_%: env_%
	$(FLUTTER) build appbundle --flavor $* \
		--obfuscate --split-debug-info=build/symbols/$*

# --- Checks -------------------------------------------------------------------

analyze: ## Format check and static analysis
	$(DART) format --set-exit-if-changed .
# --fatal-infos because AGENTS.md requires zero *issues*, not zero errors.
# `dart analyze` defaults to --no-fatal-infos, so without this an info-level
# lint passes here and the contract is documentation only.
	$(DART) analyze --fatal-infos

test: ## Run unit and widget tests
	$(FLUTTER) test

coverage: ## Enforce authored lib coverage using unit/widget and device integration traces
	@test -n "$(COVERAGE_DEVICE)" || (echo "COVERAGE_DEVICE is required (use an explicit iOS device id)." >&2; exit 2)
	@$(FLUTTER) devices --machine --device-timeout 10 | $(DART) run tool/require_ios_device.dart "$(COVERAGE_DEVICE)"
	mkdir -p coverage
	$(FLUTTER) test --coverage --coverage-path=coverage/unit.lcov
	$(FLUTTER) test --coverage --coverage-path=coverage/integration.lcov integration_test/cases/app_flow_test.dart -d "$(COVERAGE_DEVICE)" --flavor $(COVERAGE_FLAVOR)
	$(DART) run tool/coverage_gate.dart --root="$(CURDIR)" --minimum=$(COVERAGE_MINIMUM) --output=coverage/lcov.info coverage/unit.lcov coverage/integration.lcov

clean:
	$(FLUTTER) clean
