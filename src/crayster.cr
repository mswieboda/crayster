require "clim"

module Crayster
  VERSION = "0.3.0"

  class Cli < Clim
    DEBUG = true

    EXECUTABLE = "crayster"

    DEFAULT_NEW_NAME   = "NewCraysterProject"
    DEFAULT_PARENT_DIR = "./"

    @@exec_dir : String = ""
    @@test_run = DEBUG

    main do
      desc "Create new Cray (Crystal RayLib) project"
      usage "#{EXECUTABLE} [--name NAME] [--parent-dir PARENT_DIRECTORY] [NAME]"
      version "Version #{VERSION}", short: "-v"

      option "-n NAME", "--name=NAME", type: String, desc: "Project name", required: false
      option "-p PARENT_DIRECTORY", "--parent-dir=PARENT_DIRECTORY", type: String, desc: "Parent directory to create project directory in", required: false, default: DEFAULT_PARENT_DIR
      option "-t", "--test-run", type: Bool, desc: "Test run, only prints, does not execute", required: false, default: false
      option "--force", type: Bool, desc: "Passes --force to crystal init app", required: false, default: false
      option "--skip-existing", type: Bool, desc: "Passes --skip-existing to crystal init app", required: false, default: false

      run do |opts, args|
        Cli.test_run = opts.test_run

        name = Cli.get_name(opts.name, args)
        name_under = name.underscore
        name_camel = name.camelcase

        parent_dir = opts.parent_dir
        parent_dir = parent_dir.chomp("/")

        project_dir = "#{parent_dir}/#{name_under}"

        lib_name = "lib_ext"
        lib_dir = "#{Cli.exec_dir}/#{lib_name}"
        project_lib_dir = "#{project_dir}/#{lib_name}"

        if DEBUG
          puts "VARS:"
          puts "-------------"
          puts "name: #{name}"
          puts "name_under: #{name_under}"
          puts "name_camel: #{name_camel}"
          puts "parent_dir: #{parent_dir}"
          puts "project_dir: #{project_dir}"
          puts "lib_dir: #{lib_dir}"
          puts "project_lib_dir: #{project_lib_dir}"
          puts "test_run: #{Cli.test_run}"
          puts
          puts "RUNNING:"
          puts "-------------"
        end

        result = Cli.crystal_init_app(name_camel, project_dir, opts.force, opts.skip_existing)
        Cli.copy_dir(lib_dir, project_lib_dir) if result
      end

      sub "cleanup" do
        desc "cleans up (removes recursively) a project directory"
        usage "#{EXECUTABLE} cleanup [--name=NAME] [--parent-dir=PARENT_DIRECTORY] [NAME]"

        option "-n NAME", "--name=NAME", type: String, desc: "Project name", required: false
        option "-p PARENT_DIRECTORY", "--parent-dir=PARENT_DIRECTORY", type: String, desc: "Parent directory to create project directory in", required: false, default: "./"
        option "-t", "--test-run", type: Bool, desc: "Test run, only prints, does not execute", required: false, default: false

        run do |opts, args|
          Cli.test_run = opts.test_run

          name = Cli.get_name(opts.name, args)
          name_under = name.underscore
          name_camel = name.camelcase

          parent_dir = opts.parent_dir
          parent_dir = parent_dir.chomp("/")

          project_dir = "#{parent_dir}/#{name_under}"

          if DEBUG
            puts "VARS:"
            puts "-------------"
            puts "name: #{name}"
            puts "name_under: #{name_under}"
            puts "name_camel: #{name_camel}"
            puts "parent_dir: #{parent_dir}"
            puts "project_dir: #{project_dir}"
            puts "test_run: #{Cli.test_run}"
            puts
            puts "RUNNING:"
            puts "-------------"
          end

          Cli.remove_dir(project_dir)
        end
      end
    end

    def self.init
      set_exec_dir
      test_run = DEBUG
    end

    def self.test_run=(test_run)
      @@test_run = test_run
    end

    def self.test_run
      @@test_run
    end

    def self.set_exec_dir
      @@exec_dir = File.dirname(Process.executable_path.as(String))
    end

    def self.exec_dir
      @@exec_dir
    end

    def self.run(command)
      if Cli.test_run
        puts command
      else
        puts command if DEBUG
        system command
      end
    end

    def self.crystal_init_app(name, parent_dir, force = false, skip_existing = false)
      full_args = ""
      full_args += "--force " if force
      full_args += "--skip-existing " if skip_existing
      full_args += "#{name} #{parent_dir}"

      run "crystal init app #{full_args}"
    end

    def self.copy_dir(arg_from, arg_to)
      run "cp -r #{arg_from} #{arg_to}"
    end

    def self.remove_dir(args)
      run "rm -r #{args}"
    end

    def self.get_name(opts_name, args)
      opts_name || (args.any? ? args : nil).try(&.first) || DEFAULT_NEW_NAME
    end
  end
end

Crayster::Cli.init
Crayster::Cli.start(ARGV)
