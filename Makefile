CRAYSTER_SRC_DIR ?= $(shell pwd)
SHARDS_BIN ?= $(shell which shards)
CRAYSTER_BIN ?= $(shell which crayster)
PREFIX ?= /usr/local

default: install

build:
	@# NOTE: macOS sed only, linux will be different
	@sed -e 's|___CRAYSTER_SRC_DIR___|$(CRAYSTER_SRC_DIR)|' ./src/crayster.cr > ./src/crayster.new
	@mv -- ./src/crayster.new ./src/crayster.cr
	@#head -10 ./src/crayster.cr

	$(SHARDS_BIN) build --release --no-debug $(CRFLAGS)

	@# NOTE: macOS sed only, linux will be different
	@sed -e 's|$(CRAYSTER_SRC_DIR)|___CRAYSTER_SRC_DIR___|' ./src/crayster.cr > ./src/crayster.new
	@mv -- ./src/crayster.new ./src/crayster.cr
	@#head -10 ./src/crayster.cr
build_dev:
	@# NOTE: macOS sed only, linux will be different
	@sed -e 's|___CRAYSTER_SRC_DIR___|$(CRAYSTER_SRC_DIR)|' ./src/crayster.cr > ./src/crayster.new
	@mv -- ./src/crayster.new ./src/crayster.cr
	@#head -10 ./src/crayster.cr

	$(SHARDS_BIN) build $(CRFLAGS)

	@# NOTE: macOS sed only, linux will be different
	@sed -e 's|$(CRAYSTER_SRC_DIR)|___CRAYSTER_SRC_DIR___|' ./src/crayster.cr > ./src/crayster.new
	@mv -- ./src/crayster.new ./src/crayster.cr
	@#head -10 ./src/crayster.cr
clean:
	rm -f ./bin/crayster ./bin/crayster.dwarf
install: build
	mkdir -p $(PREFIX)/bin
	cp ./bin/crayster $(PREFIX)/bin
uninstall:
	rm -fv $(CRAYSTER_BIN)
