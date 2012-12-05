module Lotion
  module Services

    def services( &block )
      block_given? ? _services.instance_eval( &block ) : _services
    end

    def _services
      @_services ||= ServiceMap.new self
    end
  end

  class ServiceMap < Struct.new( :container )

    def map( klass, &block )
      Lotion::Actor.services[ klass ] = block
    end
  end
end
