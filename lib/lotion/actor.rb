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
    #
    def app
      UIApplication.sharedApplication.delegate
    end
  end
end
