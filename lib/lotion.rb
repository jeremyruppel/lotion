require 'lotion/version'

module Lotion

  FILES = Dir[ File.expand_path( File.join( __FILE__, '../lotion/**/*.rb' ) ) ].sort.freeze

  autoload :Application, 'lotion/application'
  autoload :Concern, 'lotion/concern'
end
