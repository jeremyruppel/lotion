module Lotion
  class Input

    def initialize( options={} )
      options.each { |k, v| send( k, v ) }
    end

    def view
      @view ||= build
    end

    def view_class
      raise NotImplementedError
    end

    def value
      raise NotImplementedError
    end

    def build
      view_class.alloc
    end
  end
end
