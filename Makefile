USERNAME = my
COQ_VERSION = 8.8.2
MATHCOMP_VERSION = 1.7.0

DOCKER_BUILD_COQ_TAG = $(USERNAME)/build-coq:$(COQ_VERSION)
DOCKER_BUILD_MATHCOMP_TAG = $(USERNAME)/build-mathcomp:$(MATHCOMP_VERSION)
DOCKER_COQ_TAG = $(USERNAME)/coq:$(COQ_VERSION)

plain-coq:
	-docker build --no-cache -t $(DOCKER_COQ_TAG) .
	docker image prune -f

build-coq:
	-docker build --no-cache -t $(DOCKER_BUILD_COQ_TAG) -f Dockerfile_build-coq .
	docker image prune -f

build-mathcomp:
	-docker build --no-cache -t $(DOCKER_BUILD_MATHCOMP_TAG) -f Dockerfile_build-mathcomp .
	docker image prune -f
