module Lotion
  class Bundle

    ##
    #
    def name
      self[ 'CFBundleName' ]
    end

    ##
    #
    def display_name
      self[ 'CFBundleDisplayName' ]
    end

    ##
    #
    def identifier
      self[ 'CFBundleIdentifier' ]
    end

    ##
    #
    def version
      self[ 'CFBundleVersion' ]
    end

    ##
    #
    def []( key )
      NSBundle.mainBundle.infoDictionary[ key ]
    end
  end

  ##
  # Access to the current bundle.
  def self.bundle
    @bundle ||= Bundle.new
  end
end
