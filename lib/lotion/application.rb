# require bundle
# require core_ext/array/access
# require core_ext/hash/compact
# require core_ext/hash/reverse_merge
# require core_ext/hash/slice
# require core_ext/module/abstract
# require core_ext/module/delegation
# require core_ext/object/blank
# require core_ext/string/inflections
# require core_ext/ui_kit/ui_color
# require core_ext/ui_kit/ui_form_view_controller
# require command
# require concern
# require enum
# require form
# require hash_extensions/indifferent_access
# require hash_extensions/merge_initializer
# require hash_extensions/method_access
# require logger
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
      NSNotificationCenter.defaultCenter.addObserver command,
        selector:'call:', name:name, object:nil
    end

    ##
    #
    def views
      Lotion.views
    end

    ##
    #
    def bundle
      Lotion.bundle
    end

    ##
    #
    def logger
      Lotion.logger
    end

    ##
    #
    def application( application, didFinishLaunchingWithOptions:launchOptions )
      notify 'application:startup', launchOptions
    end
  end

  # TODO **this is experimental**. Not sure if this should be public,
  # but it's coming in pretty handy in debugging.
  def self.views
    @views ||= Hash.new { |h, k| h[ k ] = k.alloc.init }
  end
end
