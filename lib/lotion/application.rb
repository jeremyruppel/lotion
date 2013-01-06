# require core_ext/array/extract_options
# require core_ext/module/delegation
# require core_ext/string/inflections

module Lotion
  module Application

    ##
    #
    def app
      UIApplication.sharedApplication.delegate
    end
  end
end
