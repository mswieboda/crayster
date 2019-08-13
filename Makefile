SHARDS_BIN ?= $(shell which shards)
CRAYSTER_BIN ?= $(shell which crayster)
PREFIX ?= /usr/local

default: install

build:
	$(SHARDS_BIN) build --release $(CRFLAGS)
clean:
	rm -f ./bin/icr ./bin/icr.dwarf
install: build
	mkdir -p $(PREFIX)/bin
	cp ./bin/crayster $(PREFIX)/bin
uninstall:
	rm -fv $(CRAYSTER_BIN)
