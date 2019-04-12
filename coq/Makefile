include ../config.mk

COQ_VERSION = 8.8.2

DOCKER_BUILD_COQ_TAG = $(DOCKER_ID)/coq:src-$(COQ_VERSION)
DOCKER_COQ_TAG = $(DOCKER_ID)/coq:$(COQ_VERSION)

build: coq

coq: build-coq
	-docker build --no-cache -t $(DOCKER_COQ_TAG) .
	docker image prune -f

build-coq:
	-docker build --no-cache -t $(DOCKER_BUILD_COQ_TAG) -f Dockerfile_build-coq .
	docker image prune -f

distclean:
	docker rmi $(DOCKER_BUILD_COQ_TAG)
	docker rmi $(DOCKER_COQ_TAG)
