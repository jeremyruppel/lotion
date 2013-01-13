# require core_ext/ui_kit/ui_text_autocapitalization_type
# require core_ext/ui_kit/ui_text_autocorrection_type
# require core_ext/ui_kit/ui_text_spell_checking_type
# require core_ext/ui_kit/ui_keyboard_type
# require core_ext/ui_kit/ui_keyboard_appearance
# require core_ext/ui_kit/ui_return_key_type

module Lotion
  module UITextInputTraits

    ##
    # The auto-capitalization style for the text object.
    # @see UITextAutocapitalizationType
    def autocapitalization_type( value )
      view.setAutocapitalizationType UITextAutocapitalizationType[ value ]
    end

    ##
    # The auto-correction style for the text object.
    # @see UITextAutocorrectionType
    def autocorrection_type( value )
      view.setAutocorrectionType UITextAutocorrectionType[ value ]
    end

    ##
    # A Boolean value indicating whether the return key is automatically
    # enabled when text is entered by the user.
    def enables_return_key_automatically( value )
      view.setEnablesReturnKeyAutomatically value
    end

    ##
    # The appearance style of the keyboard that is associated with the
    # text object.
    # @see UIKeyboardAppearance
    def keyboard_appearance( value )
      view.setKeyboardAppearance UIKeyboardAppearance[ value ]
    end

    ##
    # The keyboard style associated with the text object.
    # @see UIKeyboardType
    def keyboard_type( value )
      view.setKeyboardType UIKeyboardType[ value ]
    end

    ##
    # The contents of the “return” key.
    # @see UIReturnKeyType
    def return_key_type( value )
      view.setReturnKeyType UIReturnKeyType[ value ]
    end

    ##
    # Identifies whether the text object should hide the text being
    # entered.
    def secure_text_entry( value )
      view.setSecureTextEntry value
    end

    ##
    # The spell-checking style for the text object.
    # @see UITextSpellCheckingType
    def spell_checking_type( value )
      view.setSpellCheckingType UITextSpellCheckingType[ value ]
    end
  end
end
