module Lotion
  class Enum < ::Hash

    ##
    # Yields self to the block for easy configuration.
    def initialize
      yield self
    end

    ##
    # Looks up the value for the given key. Raises a `NameError`
    # if the key is not defined. Useful for creating mappings.
    def []( key )
      if has_key? key
        super
      elsif has_value? key
        key
      else
        raise NameError, "No enumeration #{key} found for #{self}."
      end
    end
  end
end
