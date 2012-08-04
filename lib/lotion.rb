require 'lotion/version'

module Lotion
  autoload :Application, 'lotion/application'
  autoload :Callbacks,   'lotion/callbacks'
  autoload :Command,     'lotion/command'
  autoload :Commands,    'lotion/commands'
  autoload :Concern,     'lotion/concern'
  autoload :Container,   'lotion/container'
  autoload :Injectable,  'lotion/injectable'
  autoload :Injector,    'lotion/injector'
  autoload :Prototype,   'lotion/prototype'

  class LotionError < StandardError; end
  class InjectionError < LotionError; end
end
