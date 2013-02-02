# require concern
# require notifications

module Lotion
  module Actor
    extend Lotion::Concern
    include Lotion::Notifications

    included do
      # TODO #bounds causes problems if a UIView wants to be an actor.
      # Perhaps this should be a separate concern, or it could be
      # removed since it isn't really proving itself useful anyhow.
      delegate :bounds, :logger, :window, :views,  :to => :app
    end

    ##
    # A handle for the app delegate instance.
    def app
      UIApplication.sharedApplication.delegate
    end

    # TODO this belongs somewhere else.
    def alert( title, message )
      view = UIAlertView.alloc.initWithTitle title,
        message:           message,
        delegate:          nil,
        cancelButtonTitle: 'Ermagerd',
        otherButtonTitles: nil
      view.show
      # TODO probably need to assign a delegate here
      # and release this view when we're done.
    end

    included do
      delegate :class_name, :class_type, :concern, :to => :class
    end

    module ClassMethods

      # TODO this should be its own concern, Lotion::Naming

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
