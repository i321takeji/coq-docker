MAKE = make

build:
	$(MAKE) -C coq build
	$(MAKE) -C coq+math-comp build

distclean:
	-$(MAKE) -C coq distclean
	-$(MAKE) -C coq+math-comp distclean
