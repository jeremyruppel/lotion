# require validator

module Lotion
  class LengthValidator < Validator

    def validate( value, attribute, errors )
      if length = options[ :maximum ]
        errors[ attribute ] << 'is too long' if value.length > length
      end
      if length = options[ :minimum ]
        errors[ attribute ] << 'is too short' if value.length < length
      end
    end
  end
end
