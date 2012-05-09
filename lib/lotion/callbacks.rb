# require concern

module Lotion
  module Callbacks
    extend Lotion::Concern

    module Shared

      def on( event, &block )
        callbacks[ event ] << block
      end

      def trigger( event, *args )
        callbacks[ event ].each do |block|
          block.call *args
        end
      end

      protected

      def callbacks
        @callbacks ||= Hash.new { |h, k| h[ k ] = [ ] }
      end
    end

    include Lotion::Callbacks::Shared

    module ClassMethods
      include Lotion::Callbacks::Shared
    end
  end
end
