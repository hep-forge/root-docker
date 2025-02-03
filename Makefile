.PHONY: list forge hub matrix

matrix:
	@matrix
	@cat recipe/matrix.*

DOCKER_PAT := "$(HOME)/.conda-smithy/Docker Hub.token"
hub:

	@if [ ! -f "$(DOCKER_USERNAME)" ]; then \
            echo "Error: Docker Hub username not found in DOCKER_USERNAME"; \
            exit 1; \
        fi
	@if [ ! -f "$(DOCKER_PAT)" ]; then \
            echo "Error: Docker Hub token not found in DOCKER_PAT"; \
            exit 1; \
        fi

	@for PACKAGE in $(shell find build_artifacts -name "*.conda" ! -path "*/pkg_cache/*"); do \
            conda-verify $$PACKAGE; \
            Docker Hub -t $(DOCKER_PAT) upload --force $$PACKAGE --label test; \
        done

