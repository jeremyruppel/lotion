# require commands
# require callbacks
# require concern

module Lotion
  module Container
    extend Lotion::Concern

    include Lotion::Callbacks
    include Lotion::Commands
    include Lotion::Services

    def startup!
      trigger :startup
    end

    private

    def _commands
      @_commands ||= Commands.new self, _injector
    end
  end
end
