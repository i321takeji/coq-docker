DOCKER_ID = my

MAKE = make

build:
	DOCKER_ID=$(DOCKER_ID) $(MAKE) -e -C coq build
