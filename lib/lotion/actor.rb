# require concern
# require notifications

module Lotion
  module Actor
    extend Lotion::Concern
    include Lotion::Notifications

    included do
      delegate :bounds, :logger, :window, :views,  :to => :app
    end

    ##
    # A handle for the app delegate instance.
    def app
      UIApplication.sharedApplication.delegate
    end

    included do
      delegate :class_name, :class_type, :concern, :to => :class
    end

    module ClassMethods

      ##
      # The concern of this actor.
      def concern
        class_name[ /^(\w+)#{class_type}$/, 1 ].underscore
      end

      ##
      # The type of this actor.
      # TODO avoid hard coding this and remove concrete dependencies
      # on other framework classes.
      def class_type
        ancestors.find( &:abstract? ).abstract_type
      end

      ##
      # The class name of this actor.
      def class_name
        to_s
      end
    end
  end
end
