# crayster

TODO: Write a description here

## Installation

Add this to your application's `shard.yml`:

```
dependencies:
  clim:
    github: mswieboda/crayster
    version: 0.3.0
```

## Usage

```
$ ./crayster --help

  Create new Cray (Crystal RayLib) project

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

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/your-github-user/crayster/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Matt Swieboda](https://github.com/your-github-user) - creator and maintainer