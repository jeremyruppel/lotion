require 'lotion/version'

module Lotion

  FILES = Dir[ File.expand_path( File.join( __FILE__, '../**/*.rb' ) ) ].sort.freeze

  autoload :Concern, 'lotion/concern'
end
