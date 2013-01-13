# require core_ext/module/delegation
# require core_ext/string/inflections
# require core_ext/ui_kit/ui_text_field
# require command
# require concern
# require enum
# require form
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
