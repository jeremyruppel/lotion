module Lotion
  class Input

    attr_accessor :form

    delegate :navigationController, :to => :form

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

    def clear!
      raise NotImplementedError
    end

    def build
      # TODO alloc.init?
      view_class.alloc
    end
  end
end
