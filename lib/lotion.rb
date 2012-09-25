require 'lotion/version'

module Lotion
  autoload :Callbacks, 'lotion/callbacks'
  autoload :Command,   'lotion/command'
  autoload :Commands,  'lotion/commands'
  autoload :Concern,   'lotion/concern'
  autoload :Container, 'lotion/container'
  autoload :Services,  'lotion/services'

  class LotionError < StandardError; end
end
