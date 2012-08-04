require 'codependency'
require 'pathname'

module Lotion

  def self::Dependencies( file )
    @dependencies ||= begin
      start = File.expand_path File.join __FILE__, '../container.rb'
      graph = Codependency::Graph.new start
      app   = Pathname.new( file ).dirname

      graph.files.map { |f| Pathname.new( f ).relative_path_from( app ).to_s }
    end
  end
end
