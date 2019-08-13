default: build

shards:
	if [ ! -d "./lib" ]; then shards install; fi

build: shards
	crystal build src/crayster.cr

release: shards
	crystal build --release --no-debug src/crayster.cr
