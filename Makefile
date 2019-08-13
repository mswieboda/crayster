default: build_exec

build_exec:
	crystal build src/crayster.cr

build_exec_release:
	crystal build --release src/crayster.cr
