# require commands
# require callbacks
# require concern

module Lotion
  module Container
    extend Lotion::Concern

    include Lotion::Callbacks

    # def injector( &block )
    #   block_given? ? _injector.instance_eval( &block ) : _injector
    # end

    def commands( &block )
      block_given? ? _commands.instance_eval( &block ) : _commands
    end

    def startup!
      trigger :startup
    end

    private

    # def _injector
    #   @_injector ||= Injector.new self do
    #     map Lotion::Application => container
    #   end
    # end

    def _commands
      @_commands ||= Commands.new self, _injector
    end
  end
end
