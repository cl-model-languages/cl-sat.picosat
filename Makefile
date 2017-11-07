
version = 965

all: picosat/picosat

picosat:
	curl http://fmv.jku.at/picosat/picosat-$(version).tar.gz | tar xz
	mv picosat-$(version) picosat

picosat/picosat: picosat
	cd picosat ; ./configure.sh ; $(MAKE)

