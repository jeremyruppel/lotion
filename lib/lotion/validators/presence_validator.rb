module Lotion
  class PresenceValidator

    # TODO move to superclass
    def initialize( options={} )
      @options = case options
      when TrueClass
        { }
        # TODO probably want to set defaults here, like:
        # { :allow_nil => false }
      when Hash
        options
      else
        # TODO probably want to raise an exception here
      end
    end

    ##
    #
    def validate( value, attribute, errors )
      errors[ attribute ] << 'is blank' if value.blank?
    end
  end
end
