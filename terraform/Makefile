DOCKER_IMAGE := hashicorp/terraform:light

DO_TOKEN := ${DIGITALOCEAN_TOKEN}
DO_REGION := "fra1"
K8S_VERSION := "1.13.2-do.1"

K8S_NAME := "demo"
K8S_NODE_COUNT := 1

TERRAFORM_FLAGS = -var "token=$(DO_TOKEN)"  \
		-var "region=$(DO_REGION)"  \
		-var "name=$(K8S_NAME)"  \
		-var "k8s_version=$(K8S_VERSION)"  \
		-var "node_count=$(K8S_NODE_COUNT)"

all: validate init plan 

init:
	@docker run -it --rm -w $$PWD -v $$PWD:$$PWD $(DOCKER_IMAGE) init \
		$(TERRAFORM_FLAGS)

plan:
	@docker run -it --rm -w $$PWD -v $$PWD:$$PWD $(DOCKER_IMAGE) plan \
		$(TERRAFORM_FLAGS)

apply: ## 
	@docker run -it --rm -w $$PWD -v $$PWD:$$PWD $(DOCKER_IMAGE) apply \
		$(TERRAFORM_FLAGS)

destroy: ## Destroys 
	@docker run -it --rm -w $$PWD -v $$PWD:$$PWD $(DOCKER_IMAGE) destroy \
		$(TERRAFORM_FLAGS)

graph: ## Create a visual graph of Terraform resources
	@docker run -it --rm -w $$PWD -v $$PWD:$$PWD $(DOCKER_IMAGE) graph 

fmt:
	@docker run -it --rm -w $$PWD -v $$PWD:$$PWD $(DOCKER_IMAGE) fmt *.tf

version:
	@docker run -it --rm -w $$PWD -v $$PWD:$$PWD $(DOCKER_IMAGE) version

validate-fmt:
	@docker run -it --rm -w $$PWD -v $$PWD:$$PWD $(DOCKER_IMAGE) fmt -check=true -diff=true

validate: ## Validates the Terraform files
	@docker run -it --rm -w $$PWD -v $$PWD:$$PWD $(DOCKER_IMAGE) validate -check-variables=false . && echo "[OK] terraform validated"

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
