.PHONY: setup generate analyze test coverage clean

FLUTTER ?= fvm flutter
DART ?= fvm dart
COVERAGE_DEVICE ?=
COVERAGE_MINIMUM ?= 80

setup: ## Install dependencies and run all code generation
	$(FLUTTER) pub get
	$(MAKE) generate

generate: ## Run code generation (l10n, then build_runner)
	$(DART) run intl_utils:generate
	$(DART) run build_runner build

analyze: ## Format check and static analysis
	$(DART) format --set-exit-if-changed .
	$(DART) analyze

test: ## Run unit and widget tests
	$(FLUTTER) test

coverage: ## Enforce authored lib coverage using unit/widget and device integration traces
	@test -n "$(COVERAGE_DEVICE)" || (echo "COVERAGE_DEVICE is required (use an explicit iOS device id)." >&2; exit 2)
	@$(FLUTTER) devices --machine --device-timeout 10 | $(DART) run tool/require_ios_device.dart "$(COVERAGE_DEVICE)"
	mkdir -p coverage
	$(FLUTTER) test --coverage --coverage-path=coverage/unit.lcov
	$(FLUTTER) test --coverage --coverage-path=coverage/integration.lcov integration_test/cases/app_flow_test.dart -d "$(COVERAGE_DEVICE)"
	$(DART) run tool/coverage_gate.dart --root="$(CURDIR)" --minimum=$(COVERAGE_MINIMUM) --output=coverage/lcov.info coverage/unit.lcov coverage/integration.lcov

clean:
	$(FLUTTER) clean
