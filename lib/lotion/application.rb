#= require lotion/command
#= require lotion/notifications

module Lotion
  module Application
    include Lotion::Notifications

    ##
    #
    def screen
      UIScreen.mainScreen
    end

    ##
    #
    def window
      @window ||= UIWindow.alloc.initWithFrame screen.bounds
    end

    ##
    #
    def on( name, command )
      notification_center.addObserver command,
        selector:'call:', name:name, object:nil
    end

    ##
    #
    def views
      @views ||= Hash.new { |h, k| h[ k ] = k.alloc.init }
    end

    ##
    #
    def application( application, didFinishLaunchingWithOptions:launchOptions )
      notify 'application:startup', launchOptions
    end
  end
end
