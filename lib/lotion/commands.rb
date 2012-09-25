# require command

module Lotion
  module Commands

    def commands( &block )
      block_given? ? _commands.instance_eval( &block ) : _commands
    end

    def _commands
      @_commands ||= CommandMap.new self
    end
  end

  class CommandMap < Struct.new( :container )

    def map( event, command )
      callbacks.on event do
        command.new( container ).execute
      end
    end
  end
end
