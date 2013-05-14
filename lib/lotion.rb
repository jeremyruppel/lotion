require 'lotion/version'
require 'codependency'

module Lotion
  class << self

    ##
    # Public API for accessing the dependency graph. Checks to make sure
    # we are in a RubyMotion Rakefile, then yields the graph to the block.
    # Projects and libraries can use this to add themselves to the
    # dependency graph search path.
    def require
      unless defined?( Motion::Project::Config )
        raise <<-EOS
====================================================
This file must be required in a RubyMotion Rakefile.
====================================================
        EOS
      end

      yield graph
    end

    private

    ##
    # The shared dependency graph. Projects and libraries should access
    # this through `Lotion.require`.
    def graph
      @graph ||= Codependency::Graph.new
    end
  end
end

##
# Add this library to the load path.
Lotion.require do |graph|
  graph.path << File.expand_path( '..', __FILE__ )
end
