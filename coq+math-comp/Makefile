include ../config.mk

MATH_COMP_VERSION = 1.8.0

DOCKER_BUILD_MATH_COMP_TAG = $(DOCKER_ID)/coq:mathcomp-$(MATH_COMP_VERSION)-src
DOCKER_COQ_MATH_COMP_TAG = $(DOCKER_ID)/coq:mathcomp-$(MATH_COMP_VERSION)


build: coq_math-comp

coq_math-comp: build-math-comp
	-docker build -t $(DOCKER_COQ_MATH_COMP_TAG) .
	docker image prune -f

build-math-comp:
	-docker build --target math-comp-build -t $(DOCKER_BUILD_MATH_COMP_TAG) .
	docker image prune -f

distclean:
	docker rmi $(DOCKER_BUILD_MATH_COMP_TAG)
	docker rmi $(DOCKER_COQ_MATH_COMP_TAG)
