module Lotion
  module Callbacks
    extend Lotion::Concern

    ##
    #
    def on( event, &block )
      _callbacks[ event ] << block
    end

    ##
    #
    def trigger( event, *args )
      _callbacks[ event ].each do |block|
        block.call *args
      end
    end

    protected

    ##
    #
    def _callbacks
      @_callbacks ||= Hash.new { |h, k| h[ k ] = [ ] }
    end
  end
end
