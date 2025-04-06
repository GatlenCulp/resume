# Basic Usage:
#   make <rule>             : Run a specific rule (e.g., make test)
#   make VAR=value <rule>   : Run rule with environment variable (e.g., make DOCS_PORT=8080 docs-serve)
#
# Common Rules: help, clean, test, format, lint, docs-serve
#
# Rules can depend on other rules which run first. Rules with _ prefix are internal helpers.

PROJECT_NAME = gatlen-resume
MODULE_NAME = resume
PYTHON_VERSION = 3.12
PYTHON_INTERPRETER = python
DOCS_PORT ?= 8000
.DEFAULT_GOAL := help

# ━━━━━━━━━━━━━━━━━━━━━━━━━━ Project Rules ━━━━━━━━━━━━━━━━━━━━━━━━━ #
.PHONY: run watch

# For some reason, watch does not properly use the design.
watch:
	rendercv render resume/Gatlen_Culp_CV.yaml \
	-o out \
	--locale-catalog resume/locale_CV.yaml \
	--design resume/design_CV.yaml \
	--watch

run:
	rendercv render resume/Gatlen_Culp_CV.yaml \
	-o out \
	--locale-catalog resume/locale_CV.yaml \
	--design resume/design_CV.yaml \
	--markdown-path README.md


# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━ Utilities ━━━━━━━━━━━━━━━━━━━━━━━━━━━ #
.PHONY: all help _print-logo _welcome

all: help

help: _print-logo  ## Show this help message
	@echo "\n\033[1m~ Available rules: ~\033[0m\n"
	@echo "For VSCode/Cursor, try: ⇧ ⌘ P, Tasks: Run Task\n"
	@grep -E '^[a-zA-Z][a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[38;5;222m%-30s\033[0m %s\n", $$1, $$2}'

_welcome: ## Print a Welcome screen
	curl -s https://raw.githubusercontent.com/GatlenCulp/gatlens-opinionated-template/refs/heads/master/welcome.txt

_print-logo: ## Prints the GOTem logo
	@echo "\033[38;5;39m   ____  ___ _____"
	@echo "  / ___|/ _ \_   _|__ _ __ ___"
	@echo " | |  _| | | || |/ _ \ '_ \` _ \\"
	@echo " | |_| | |_| || |  __/ | | | | |"
	@echo "  \____|\___/ |_|\___|_| |_| |_|\033[0m"

# ━━━━━━━━━━━━━━━━━━━━━━━ Filesystem Cleaning ━━━━━━━━━━━━━━━━━━━━━━ #
.PHONY: clean _clean-mac _clean-latex _clean-python

clean: _clean-mac _clean-latex _clean-python ## Delete all compiled Python files and LaTeX build artifacts
	find . -type d -name ".cache" -delete

_clean-mac: ## Clean macOS-related files
	find . -type f -name "*.DS_store" -delete

_clean-latex: ## Clean all LaTeX helper files
	find . -type f -name "*.aux" -delete
	find . -type f -name "*.bbl" -delete
	find . -type f -name "*.bcf" -delete
	find . -type f -name "*.blg" -delete
	find . -type f -name "*.fdb_latexmk" -delete
	find . -type f -name "*.fls" -delete
	find . -type f -name "*.lof" -delete
	find . -type f -name "*.log" -delete
	find . -type f -name "*.lot" -delete
	find . -type f -name "*.out" -delete
	find . -type f -name "*.synctex.gz*" -delete
	find . -type f -name "*.toc" -delete
	find . -type d -name "_minted*" -delete

_clean-python: ## Clean all compiled Python files
	find . -type f -name "*.py[co]" -delete
	find . -type d -name "__pycache__" -delete


# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━ Testing ━━━━━━━━━━━━━━━━━━━━━━━━━━━━ #

.PHONY: test test-fastest test-continuous test-debug-last _clean_manual_test

test: ## Run all tests
	pytest -vvv --durations=0

test-fastest: ## Run tests with fail-fast option
	pytest -vvv -FFF

test-continuous: ## Run tests in watch mode using pytest-watcher
	ptw . --now --runner pytest --config-file pyproject.toml -vvv -FFF

test-debug-last: ## Debug last failed test with pdb
	pytest --lf --pdb


manual-test: _clean_manual_test ## Run manual tests
	mkdir -p manual_test
	@echo "<manual-test not yet implemented>"

_clean_manual_test:
	rm -rf manual_test

# ━━━━━━━━━━━━━━━━━━━━━━━━━ Quality Assurance ━━━━━━━━━━━━━━━━━━━━━━━ #

.PHONY: lint format

lint: ## Lint using ruff (use `make format` to do formatting)
	ruff check --config pyproject.toml $(MODULE_NAME)

format: ## Format source code
	ruff format --config pyproject.toml $(MODULE_NAME)

# ━━━━━━━━━━━━━━━━━━━━━━━━━━ Documentation ━━━━━━━━━━━━━━━━━━━━━━━━━ #

.PHONY: docs-serve docs-publish

docs-serve: ## Serve documentation locally on port $(DOCS_PORT)
	cd docs && \
	mkdocs serve -a localhost:$(DOCS_PORT) || \
	echo "\n\nInstance found running on $(DOCS_PORT), try killing process and rerun."

# Makes sure docs can be served prior to actually deploying
docs-publish: ## Build and deploy documentation to GitHub Pages
	cd docs && \
	mkdocs build && \
	mkdocs gh-deploy --clean

# ━━━━━━━━━━━━━━━━━━━━━ Packaging & Environment ━━━━━━━━━━━━━━━━━━━━ #

.PHONY: create_environment
create_environment: ## Set up python interpreter environment
	uv venv
	@echo ">>> New virtualenv with uv created. Activate with:\nsource '.venv/bin/activate'"


.PHONY: requirements
requirements: ## Install Python Dep
	
	uv sync
	


.PHONY: publish-all
publish-all: format lint publish docs-publish ## Run format, lint, publish package and docs

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━ Pre-Commits ━━━━━━━━━━━━━━━━━━━━━━━━━━ #
.PHONY: pre-commit-test pre-commit-update

pre-commit-test: ## Test hooks
	pre-commit run --all-files
	git add .pre-commit-config.yaml
	pre-commit run commitizen --hook-stage commit-msg --commit-msg-filename ".git/COMMIT_EDITMSG"

pre-commit-update: ## Update, install, and test hooks w/ new config
	pre-commit autoupdate
	pre-commit install
	$(MAKE) pre-commit-test
