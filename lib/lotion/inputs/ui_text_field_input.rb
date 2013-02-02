# require input
# require core_ext/ui_kit/ui_view_traits
# require core_ext/ui_kit/ui_text_input_traits
# require core_ext/ui_kit/ui_text_field_traits

module Lotion
  class UITextFieldInput < Lotion::Input
    include Lotion::UIViewTraits
    include Lotion::UITextInputTraits
    include Lotion::UITextFieldTraits

    ##
    #
    def value
      view.text
    end

    ##
    #
    def view_class
      UITextField
    end

    ##
    #
    def clear!
      view.setText nil
    end
  end
end
