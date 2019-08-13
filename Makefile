default: build

build:
	crystal build src/crayster.cr

release:
	crystal build --release src/crayster.cr
