module Lotion
  class Input
    include Lotion::Naming

    abstract!

    attr_accessor :form

    delegate :navigationController, :to => :form

    ##
    # Passing a hash of options to .new will call each method
    # in turn on the new input. This allows for quick and concise
    # configuration of new view components.
    def initialize( options={} )
      options.each { |k, v| send( k, v ) }
    end

    ##
    # The UIView associated with this input.
    def view
      @view ||= build
    end

    ##
    # The UIView class associated with this input.
    # Subclasses are expected to override this method.
    def view_class
      raise NotImplementedError
    end

    ##
    # The value of this input.
    # Subclasses are expected to override this method.
    def value
      raise NotImplementedError
    end

    ##
    # Clears any user-entered information from this input.
    # Subclasses are expected to override this method.
    def clear!
      raise NotImplementedError
    end

    protected

    ##
    # Allocates and inintializes a new instance of this
    # input's #view_class. Subclasses may override this
    # method if custom initialization is needed.
    def build
      # TODO alloc.init?
      view_class.alloc
    end
  end
end
