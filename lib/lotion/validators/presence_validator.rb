# require validator

module Lotion
  class PresenceValidator < Validator

    ##
    #
    def validate( value, attribute, errors )
      errors[ attribute ] << 'is blank' if value.blank?
    end
  end
end
