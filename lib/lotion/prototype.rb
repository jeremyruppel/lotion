module Lotion
  module Prototype
    extend Lotion::Concern

    module ClassMethods

      def prototype( property )

        define_method :initialize do
          instance_variable_set :"@#{property}",
            self.class.class_variable_get( :"@@#{property}" ).dup.freeze
        end
      end
    end
  end
end
