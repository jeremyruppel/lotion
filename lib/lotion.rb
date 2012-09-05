require 'lotion/version'
require 'lotion/core_ext'

module Lotion
  autoload :Application, 'lotion/application'
  autoload :Callbacks,   'lotion/callbacks'
  autoload :Command,     'lotion/command'
  autoload :Commands,    'lotion/commands'
  autoload :Concern,     'lotion/concern'
  autoload :Container,   'lotion/container'
  autoload :Delegate,    'lotion/delegate'
  autoload :Injectable,  'lotion/injectable'
  autoload :Injector,    'lotion/injector'

  class LotionError < StandardError; end
  class InjectionError < LotionError; end
end
