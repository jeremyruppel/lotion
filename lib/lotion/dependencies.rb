require 'codependency'
require 'pathname'

module Lotion

  def self::Dependencies( file )
    start = File.join File.dirname( __FILE__ ), 'container.rb'
    graph = Codependency::Graph.new start
    graph.files
  end
end


#
# SOURCE = Dir[ File.expand_path( File.join( __FILE__, '../lotion/**/*.rb' ) ) ]
# FILES  = Codependency::Graph.new( SOURCE ).files.freeze
# PATHS  = FILES.map { |f| Pathname.new( f ) }.freeze
#
# def self::Dependencies( file )
#   path = Pathname.new( file ).dirname
#   PATHS.map { |p| p.relative_path_from( path ).to_s }
# end