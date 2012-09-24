require 'codependency'
require 'pathname'

module Lotion
  class Project

    ##
    # the topologically sorted list of lotion dependencies, relative
    # to the current working directory
    def files
      @files ||= begin
        graph.files.map do |f|
          Pathname.new( f ).relative_path_from( Dir.pwd ).to_s
        end
      end
    end

    ##
    # the lotion dependency graph
    def graph
      Codependency::Graph.new container
    end

    ##
    # path to Lotion::Container, will automatically bring in
    # all of the necessary dependencies
    def container
      File.expand_path File.join( __FILE__, '../container.rb' )
    end
  end
end

if defined?( ::Motion )

  ##
  # if ::Motion is defined, install the lotion dependencies in the project
  Motion::Project::App.setup do |app|

    lotion = Lotion::Project.new

    app.files_dependencies 'app/app_delegate.rb' => lotion.files
    app.files << lotion.files
  end
end
