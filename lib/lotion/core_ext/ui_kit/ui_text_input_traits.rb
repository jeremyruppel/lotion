module Lotion
  module UITextInputTraits

    ##
    # The auto-capitalization style for the text object.
    def autocapitalization_type( value )
      view.autocapitalizationType = value
    end

    ##
    # The auto-correction style for the text object.
    def autocorrection_type( value )
      view.autocorrectionType = value
    end

    ##
    # A Boolean value indicating whether the return key is automatically
    # enabled when text is entered by the user.
    def enables_return_key_automatically( value )
      view.enablesReturnKeyAutomatically = value
    end

    def keyboard_appearance( value )
      view.keyboardAppearance = value
    end

    def keyboard_type( value )
      view.keyboardType = value
    end

    def return_key_type( value )
      view.returnKeyType = value
    end

    def secure_text_entry( value )
      view.secureTextEntry = value
    end

    def spell_checking_type( value )
      view.spellCheckingType = value
    end
  end
end
