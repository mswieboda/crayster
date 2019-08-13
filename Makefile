default: build

build:
	crystal build src/crayster.cr

release:
	crystal build --release --no-debug src/crayster.cr
