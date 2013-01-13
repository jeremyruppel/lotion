module Bacon
  module Double

    ##
    # A very simple test double class that will raise a
    # `Bacon::Error` if it receives any unexpected messages.
    class TestDouble < Struct.new( :name, :methods )

      def method_missing( method, *args, &block )
        methods.has_key?( method ) ? methods[ method ] : begin
          raise Bacon::Error.new :failed, <<-EOS.strip
            Double #{name} received unexpected message
            "#{method}" with args #{args.inspect}.
          EOS
        end
      end
    end

    ##
    # Creates a simple test double that will respond to
    # the specified methods.
    def double( name, methods={} )
      TestDouble.new name, methods
    end
  end
end

Bacon::Context.send :include, Bacon::Double
