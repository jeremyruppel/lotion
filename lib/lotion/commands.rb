# require command

module Lotion
  class Commands < Struct.new( :callbacks, :injector )

    def map( event, command )
      callbacks.on event do
        instance = command.new
        injector.inject_into instance
        instance.execute
      end
    end
  end
end
