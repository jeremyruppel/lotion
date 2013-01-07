# require concern
# require notifications

module Lotion
  module Actor
    extend Lotion::Concern
    include Lotion::Notifications

    ##
    #
    def app
      UIApplication.sharedApplication.delegate
    end
  end
end
