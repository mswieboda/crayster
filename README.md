Creates a new Cray (Crystal RayLib) project, copying the needed RayLib MacOS dylib to the directory as well.


## Usage

First, checkout the repo, then build the executable by running `make` (this will install dependencies via `shards install` unless already done).

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

Running `make` (or `make release`) will build the `crayster` executable via `crystal build`.

This will install dependencies via `shards install` unless already done.

#### TODO:

- [x] crystal init app NAME
- [x] copy lib_ext/libraylib.dylib (macOS only)
- [ ] copy lib file based on current OS (macOS/Linux/Win) .dylib/.so/.dll
- [ ] make RayLib dynamically from source (using https://github.com/tapgg/cray repo) (for macOS only)
- [ ] make RayLib dynamically from source (using https://github.com/tapgg/cray repo) for current OS (macOS/Linux/Win)
- [x] create project Makefile
- [ ] add cray dependency to shards.yml
- [ ] shell of Game/Window/etc class
- [ ] shell of LibRay game loop logic

## Contributing

1. Fork it (<https://github.com/mswieboda/crayster/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
