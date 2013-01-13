module Lotion
  module View
    class Proxy
      def initialize( &block )
        instance_eval &block
        self
      end

      def view
        @view ||= view_class.alloc
      end

      def view_class
        self.class.to_s.demodulize.constantize
      end

      def method_missing( method, *args, &block )
        view.send method, *args, &block
      end
    end
  end
end
