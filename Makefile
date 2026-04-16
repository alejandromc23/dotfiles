.PHONY: setup-linux
setup-linux: ## setup linux
	cd ./os/linux && ./setup.sh && cd ../..

.PHONY: setup-mac
setup-mac: ## setup mac
	cd ./os/mac && ./setup.sh && cd ../..

