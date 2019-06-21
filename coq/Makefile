include ../config.mk

COQ_VERSION = 8.9.0

DOCKER_BUILD_COQ_TAG = $(DOCKER_ID)/coq:src-$(COQ_VERSION)
DOCKER_COQ_TAG = $(DOCKER_ID)/coq:$(COQ_VERSION)

build: coq

coq: build-coq
	-docker build -t $(DOCKER_COQ_TAG) .
	docker image prune -f

build-coq:
	-docker build --no-cache --target coq-build -t $(DOCKER_BUILD_COQ_TAG) .
	docker image prune -f

distclean:
	docker rmi $(DOCKER_BUILD_COQ_TAG)
	docker rmi $(DOCKER_COQ_TAG)
