# require concern
# require callbacks
# require commands
# require services

module Lotion
  module Container
    extend Lotion::Concern

    include Lotion::Callbacks
    include Lotion::Commands
    include Lotion::Services

    class << self
      attr_accessor :instance
    end

    def initialize
      super
      Lotion::Container.instance = self
    end

    # TODO use alias_method_chain here to do this transparently
    def startup!
      trigger :startup
    end
  end
end
