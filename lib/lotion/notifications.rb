module Lotion
  module Notifications

    ##
    # Publishes a notification named `name` to the default
    # notification center. You can optionally pass an `info`
    # object that will be available to any subscribers
    # of the notification.
    def notify( name, info=nil )
      notification_center.postNotificationName name,
        object:self, userInfo:info
    end

    ##
    # The shared notification center instance.
    def notification_center
      NSNotificationCenter.defaultCenter
    end
  end
end
