class UIView

  class << self

    ##
    # Allocates a new view and configures it in the given block.
    def configure( options={}, &block )
      alloc.tap do |view|
        view.initWithFrame options[ :frame ] if options[ :frame ]
        view.initWithCoder options[ :coder ] if options[ :coder ]

        proxy.new( view ).instance_exec &block
      end
    end

    ##
    # Configures or returns an anonymous class to act as a proxy
    # while in the .configure block.
    def proxy( &block )
      @proxy ||= Struct.new( :view )
      @proxy.instance_exec &block if block_given?
      @proxy
    end
  end
end
