require 'lotion/version'
require 'codependency'

module Lotion

  SOURCE = Dir[ File.expand_path( File.join( __FILE__, '../lotion/**/*.rb' ) ) ]
  FILES  = Codependency::Graph.new( SOURCE ).files.freeze

  autoload :Application, 'lotion/application'
  autoload :Concern,     'lotion/concern'
end
