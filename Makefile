.PHONY: help install build run test

BIN = docker run -i -t --rm \
		-v "${PWD}:/app" \
		--name "laurel-run" \
		laurel

help: ## Display available commands
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Install dependencies
	docker build --tag=laurel .

build: ## Build laurel into an executable
	$(BIN) crystal build src/laurel.cr -o /app/bin/laurel
	@echo "\033[0;32m\nCompilation OK, please use ./bin/laurel \033[0m"

test: ## Launch laurel tests
	$(BIN) crystal spec