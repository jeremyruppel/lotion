# require core_ext/array/access
# require core_ext/hash/reverse_merge
# require core_ext/module/delegation
# require core_ext/string/inflections
# require core_ext/ui_kit/ui_button
# require core_ext/ui_kit/ui_color
# require core_ext/ui_kit/ui_text_field
# require command
# require concern
# require enum
# require form
# require form_view_controller
# require hash_extensions/indifferent_access
# require hash_extensions/merge_initializer
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
