# require input
# require core_ext/ui_kit/ui_view_traits
# require core_ext/ui_kit/ui_text_input_traits
# require core_ext/ui_kit/ui_text_field_view_mode

# TODO needs specs
module Lotion
  class UITextFieldInput < Lotion::Input
    include Lotion::UIViewTraits
    include Lotion::UITextInputTraits

    def value
      view.text
    end

    def view_class
      UITextField
    end

    def clear!
      view.setText nil
    end

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
