# require core_ext/ui_kit/ui_text_field_view_mode

module Lotion
  module UITextFieldTraits

    ##
    # The text displayed by the text field.
    def text( value )
      view.setText value
    end

    ##
    # The string that is displayed when there is no other
    # text in the text field.
    def placeholder( value )
      view.setPlaceholder value
    end

    ##
    # Controls when the standard clear button appears in
    # the text field.
    # @see UITextFieldViewMode
    def clear_button_mode( value )
      view.setClearButtonMode UITextFieldViewMode[ value ]
    end
  end
end
