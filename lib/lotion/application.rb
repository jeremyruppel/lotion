# require core_ext/module/delegation
# require core_ext/string/inflections
# require command
# require concern
# require notifications

module Lotion
  module Application
    extend Lotion::Concern
    include Lotion::Notifications

    included do
      delegate :bounds, :to => :screen
    end

    ##
    #
    def screen
      UIScreen.mainScreen
    end

    ##
    #
    def window
      @window ||= UIWindow.alloc.initWithFrame bounds
    end

    ##
    #
    # TODO add :once => true option
    def on( name, command )
      NSNotificationCenter.defaultCenter.addObserver command, selector:'call:', name:name, object:nil
    end

    ##
    #
    def application( application, didFinishLaunchingWithOptions:launchOptions )
      notify 'application:startup', launchOptions
    end
  end
end
