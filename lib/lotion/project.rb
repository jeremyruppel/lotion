require 'codependency'
require 'pathname'

module Lotion
  class Project

    ##
    # The topologically sorted list of lotion dependencies, relative
    # to the current working directory
    def files
      @files ||= begin
        graph.files.map do |f|
          # FIXME we join '.' here so project will work for our test suite.
          # It isn't necessary when lotion is used as a library, so
          # there may be a more elegant solution.
          File.join '.', Pathname( f ).relative_path_from( cwd ).to_s
        end
      end
    end

    ##
    # The lotion dependency graph
    def graph
      Codependency::Graph.new root
    end

    ##
    # Absolute path to Lotion::Application
    def root
      File.expand_path File.join( __FILE__, '../application.rb' )
    end

    def cwd
      Pathname.pwd
    end
  end
end

if defined?( ::Motion )

  ##
  # If ::Motion is defined, install the lotion dependencies in the project
  Motion::Project::App.setup do |app|
    lotion = Lotion::Project.new

    app.files += lotion.files
    app.files_dependencies './app/app_delegate.rb' => lotion.files
  end
end
