# require concern
# require naming
# require notifications

module Lotion
  module Actor
    extend Lotion::Concern
    include Lotion::Naming
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
  end
end
