module Lotion
  module Notifications

    ##
    #
    def notify( name, info=nil )
      NSNotificationCenter.defaultCenter.postNotificationName name, object:self, userInfo:info
    end
  end
end
