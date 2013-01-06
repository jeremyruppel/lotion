# require core_ext/module/delegation
# require core_ext/string/inflections
# require concern

module Lotion
  module Application

    ##
    #
    def app
      UIApplication.sharedApplication.delegate
    end
  end
end
