#= require lotion/notifications

module Lotion
  class Command
    include Lotion::Notifications

    ##
    #
    def initialize( notification )
      @notification = notification
    end
    attr_reader :notification

    ##
    #
    # TODO this could be a macro on Module
    def call
      raise NotImplementedError, 'Lotion::Command subclasses are expected to define #call'
    end

    ##
    #
    def self.call( notification )
      new( notification ).call
    end

    ##
    # TODO delegate
    def name
      notification.name
    end

    ##
    # TODO delegate
    def object
      notification.object
    end

    ##
    # TODO delegate
    def userInfo
      notification.userInfo
    end
  end
end
