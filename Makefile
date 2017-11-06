
version = 965

picosat.tar.gz:
	curl http://fmv.jku.at/picosat/picosat-$(version).tar.gz > picosat.tar.gz

picosat:
	tar xvf picosat.tar.gz
	mv picosat-$(version) picosat

picosat/picosat:
	$(MAKE) -C picosat

