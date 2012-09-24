# require command

module Lotion
  class Commands < Struct.new( :callbacks, :injector )

    def map( event, command )
      callbacks.on event do
        injector.fill( command.new ).execute
      end
    end
  end
end
