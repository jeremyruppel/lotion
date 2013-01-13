module Lotion
  class Enum < ::Hash

    ##
    # Yields self to the block for easy configuration.
    def initialize
      yield self
    end

    ##
    # Looks up the value for the given key. If the key is not defined,
    # returns the key instead of `nil`. Useful for creating mappings.
    def []( key )
      has_key?( key ) ? super : key
    end
  end
end
