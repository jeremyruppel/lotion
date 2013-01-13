# require core_ext/ui_kit/ui_view_traits

class UIView

  class << self

    ##
    # Hook to build a new view. Subclasses may override this if
    # they need to use a different factory method.
    def build( options )
      alloc
    end

    ##
    # Allocates a new view and configures it in the given block.
    def configure( options={}, &block )
      build( options ).tap do |view|
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
      @proxy.class_eval &block if block_given?
      @proxy
    end
  end
  
  proxy do
    include Lotion::UIViewTraits
  end
end
