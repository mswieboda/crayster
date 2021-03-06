Creates a new Cray (Crystal RayLib) project with all dependencies and initial source code:

- Creates crystal app via `crystal init app`
- Copies the Cray RayLib external library to the new app directory (`/lib_ext`)
- Creates the projects `Makefile` to build with the RayLib external library
- Adds the `cray` dependency to the project's `shard.yml`
- Creates initial Cray source code with a `Game` class that creates a window and runs game logic (update/draw)

## Usage

First, checkout the repo, then build the executable by running `make` or `make install`. This will build a release of `crayster` and place in `/usr/local/bin` similar to Homebrew installs.

To checkout, compile, and install:
```
$ git clone git@github.com:mswieboda/crayster.git
$ cd crayster
$ make
```

Create a new cray project:
```
$ cd ~/some_projects_code_directory
$ crayster new_cray_game
$ cd new_cray_game
```

Here is an output of running `crayster --help`

```
$ crayster --help

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
$ crayster FooTest              # creates ./foo_test
$ crayster abc_123              # creates ./abc_123
$ crayster abc_123 ../parent    # creates ../parent/abc_123
$ crayster NewGame ~/code       # creates ~/code/new_game
```

#### Development TODOs:

- [x] crystal init app NAME
- [x] copy lib_ext/libraylib.dylib (macOS only)
- [ ] copy lib file based on current OS (macOS/Linux/Win) .dylib/.so/.dll
- [ ] make RayLib dynamically from source (using https://github.com/tapgg/cray repo) (for macOS only)
- [ ] make RayLib dynamically from source (using https://github.com/tapgg/cray repo) for current OS (macOS/Linux/Win)
- [x] create project Makefile
- [x] add cray dependency to shards.yml
- [x] shell of Game class and LibRay game loop logic
- [ ] submit PR to [Homebrew](https://github.com/Homebrew/homebrew-core)

## Contributing

1. Fork it (<https://github.com/mswieboda/crayster/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
