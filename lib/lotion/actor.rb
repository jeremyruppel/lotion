# require concern
# require notifications

module Lotion
  module Actor
    extend Lotion::Concern
    include Lotion::Notifications

    included do
      delegate :bounds, :window, :views,  :to => :app
    end

    ##
    # A handle for the app delegate instance.
    def app
      UIApplication.sharedApplication.delegate
    end

    ##
    # The concern of this actor.
    def concern
      class_name[ /^(\w+)#{type}$/, 1 ].underscore
    end

    ##
    # The type of this actor.
    # TODO avoid hard coding this and remove concrete dependencies
    # on other framework classes.
    def type
      case self
      when UIViewController
        'ViewController'
      when Lotion::Form
        'Form'
      when Lotion::Command
        'Command'
      end
    end

    ##
    # The class name of this actor.
    def class_name
      self.class.to_s
    end
  end
end
