# require injector
# require commands
# require callbacks
# require concern

module Lotion
  module Container
    extend Lotion::Concern

    include Lotion::Callbacks

    def injector( &block )
      _injector.instance_eval &block
    end

    def commands( &block )
      _commands.instance_eval &block
    end

    def startup!
      trigger :startup
    end

    private

    def _injector
      @_injector ||= Injector.new
    end

    def _commands
      @_commands ||= Commands.new self, _injector
    end
  end
end
