.PHONY: setup generate analyze test clean

FLUTTER := fvm flutter
DART := fvm dart

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

clean:
	$(FLUTTER) clean
