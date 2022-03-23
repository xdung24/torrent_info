DOCKER=docker
APPNAME=torrent-info
SSHNUC=ssh -C -p 22 ft@192.168.1.13
.PHONY: help

help: ## Show this help message.
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

build-docker-image: ## Build docker image
	@echo 'Building $(APPNAME)'
	$(DOCKER) image build --tag="$(APPNAME):latest" .

push-docker-image: ## Push docker image
	@echo 'Pushing $(APPNAME)'
	$(DOCKER) save "$(APPNAME):latest" | $(SSHNUC) $(DOCKER) load