Creates a new Cray (Crystal RayLib) project, copying the needed RayLib MacOS dylib to the directory as well.


## Usage

First, checkout the repo, and build the executable by running `make`.

(To run a more efficient release exec, run `make release`. `make` defaults to non-release `build` for ease during development.)

Here is an output of running `./crayster --help`

```
$ ./crayster --help

  Creates a new Cray (Crystal RayLib) project, copying required RayLib library

  Usage:

    crayster [--name NAME] [--parent-dir PARENT_DIRECTORY] [NAME]

  Options:

    -n NAME, --name=NAME             Project name [type:String]
    -p PARENT_DIRECTORY, --parent-dir=PARENT_DIRECTORY
                                     Parent directory to create project directory in [type:String] [default:"./"]
    -t, --test-run                   Test run, only prints, does not execute [type:Bool] [default:false]
    --force                          Passes --force to crystal init app [type:Bool] [default:false]
    --skip-existing                  Passes --skip-existing to crystal init app [type:Bool] [default:false]
    --help                           Show this help.
    -v, --version                    Show version.

  Sub Commands:

    cleanup   cleans up (removes recursively) a project directory
```

Examples:

```
$ ./crayster FooTest              # creates ./foo_test
$ ./crayster abc_123              # creates ./abc_123
$ ./crayster abc_123 ../parent    # creates ../parent/abc_123
$ ./crayster NewGame ~/code       # creates ~/code/new_game
```

## Development

Running `make` (or `make build_exec_release`) will build the `crayster` executable via `crystal build`.

(To run a more efficient release exec, run `make release`. `make` defaults to non-release `build` for ease during development.)

#### TODO:

- [x] crystal init app NAME
- [x] copy lib_ext/libraylib.dylib
- [] make RayLib dynamically from source (using https://github.com/tapgg/cray repo)
- [] copy lib based on ENV (macOS/Linux/Win) .dylib/.so/.dll
- [x] Makefile
- [] shards.yml
- [] shell of Game/Window/etc class
- [] shell of LibRay game loop logic

## Contributing

1. Fork it (<https://github.com/your-github-user/crayster/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Matt Swieboda](https://github.com/your-github-user) - creator and maintainer
