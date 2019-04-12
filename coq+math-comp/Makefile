include ../config.mk

MATH_COMP_VERSION = 1.7.0

DOCKER_BUILD_MATH_COMP_TAG = $(DOCKER_ID)/coq:srcmathcomp-$(MATH_COMP_VERSION)
DOCKER_COQ_MATH_COMP_TAG = $(DOCKER_ID)/coq:mathcomp-$(MATH_COMP_VERSION)


build: coq_math-comp

coq_math-comp: build-math-comp
	-docker build --no-cache -t $(DOCKER_COQ_MATH_COMP_TAG) .
	docker image prune -f

build-math-comp:
	-docker build --no-cache -t $(DOCKER_BUILD_MATH_COMP_TAG) -f Dockerfile_build-math-comp .
	docker image prune -f

distclean:
	docker rmi $(DOCKER_BUILD_MATH_COMP_TAG)
	docker rmi $(DOCKER_COQ_MATH_COMP_TAG)
