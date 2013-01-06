# require concern
# require notifications

module Lotion
  module Actor
    extend Lotion::Concern

    ##
    #
    def app
      UIApplication.sharedApplication.delegate
    end
  end
end
