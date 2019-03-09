DOCKER_BUILD_TAG = my/coq-build
DOCKER_TAG = my/coq

build:
	docker build --no-cache -t $(DOCKER_BUILD_TAG) -f Dockerfile_build .
	docker build --no-cache -t $(DOCKER_TAG) .
	docker image prune -f
