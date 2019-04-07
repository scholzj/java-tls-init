PROJECT_NAME=java-tls-init

DOCKERFILE_DIR     ?= ./
DOCKER_REGISTRY    ?= docker.io
DOCKER_ORG         ?= $(USER)
DOCKER_TAG         ?= latest

all: docker_build docker_push

docker_build:
	echo "Building Docker image ..."
	docker build -t scholzj/$(PROJECT_NAME):$(DOCKER_TAG) $(DOCKERFILE_DIR)

docker_tag:
	echo "Tagging scholzj/$(PROJECT_NAME):$(DOCKER_TAG) to $(DOCKER_REGISTRY)/$(DOCKER_ORG)/$(PROJECT_NAME):$(DOCKER_TAG) ..."
	docker tag scholzj/$(PROJECT_NAME):$(DOCKER_TAG) $(DOCKER_REGISTRY)/$(DOCKER_ORG)/$(PROJECT_NAME):$(DOCKER_TAG)

docker_push: docker_tag
	echo "Pushing $(DOCKER_REGISTRY)/$(DOCKER_ORG)/$(PROJECT_NAME):$(DOCKER_TAG) ..."
	docker push $(DOCKER_REGISTRY)/$(DOCKER_ORG)/$(PROJECT_NAME):$(DOCKER_TAG)
