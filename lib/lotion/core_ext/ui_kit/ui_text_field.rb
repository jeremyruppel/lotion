# require core_ext/ui_kit/ui_view
# require core_ext/ui_kit/ui_text_input_traits
# require core_ext/ui_kit/ui_text_field_view_mode

class UITextField

  proxy do
    include Lotion::UIViewTraits
    include Lotion::UITextInputTraits

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
