require 'codependency'
require 'pathname'

module Lotion
  class Project

    ##
    # The topologically sorted list of lotion dependencies, relative
    # to the current working directory.
    def files
      @files ||= begin
        graph.files.map { |file| relative_path_from( file ) }
      end
    end

    ##
    # The lotion dependency graph.
    def graph
      Codependency::Graph.new root
    end

    ##
    # The absolute path to Lotion::Application.
    def root
      File.expand_path File.join( __FILE__, '../application.rb' )
    end

    ##
    # Finds the relative path from the current working directory to the given
    # file. Prepends a '.' if not present to help RubyMotion find files
    # for our own test suite.
    def relative_path_from( file )
      path = Pathname( file ).relative_path_from( Pathname.pwd ).to_path
      path[ /^\./ ] ? path : File.join( '.', path )
    end
  end
end

if defined?( ::Motion )

  Motion::Project::App.setup do |app|
    lotion = Lotion::Project.new

    app.files += lotion.files
    app.files_dependencies './app/app_delegate.rb' => lotion.files
  end
end
