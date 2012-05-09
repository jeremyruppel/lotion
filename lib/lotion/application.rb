# require concern
# require callbacks

module Lotion
  module Application
    extend Lotion::Concern
    include Lotion::Callbacks

    def application( application, didFinishLaunchingWithOptions:launchOptions )
      trigger :loaded, application, launchOptions
      true
    end
  end
end
