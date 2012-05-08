module Lotion
  module Application
    extend Lotion::Concern

    def application( application, options ) #didFinishLaunchingWithOptions:launchOptions
      true
    end
  end
end
