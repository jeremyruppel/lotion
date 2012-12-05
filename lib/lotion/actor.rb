module Lotion
  class Actor

    def app
      Lotion::Container.instance
    end

    class << self

      def inject( name, klass )
        define_method name do
          app.instance_eval &self.class.services[ klass ]
        end
      end

      def services
        @@services ||= { }
      end
    end
  end
end
