require 'lotion/version'
require 'codependency'
require 'pathname'

module Lotion

  SOURCE = Dir[ File.expand_path( File.join( __FILE__, '../lotion/**/*.rb' ) ) ]
  FILES  = Codependency::Graph.new( SOURCE ).files.freeze
  PATHS  = FILES.map { |f| Pathname.new( f ) }.freeze

  def self::Dependencies( file )
    path = Pathname.new( file ).dirname
    PATHS.map { |p| p.relative_path_from( path ).to_s }
  end

  autoload :Application, 'lotion/application'
  autoload :Callbacks,   'lotion/callbacks'
  autoload :Concern,     'lotion/concern'
end
