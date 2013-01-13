# require view/proxy

module Lotion
  module View
    class UITextField < Lotion::View::Proxy
      def initialize
        super.initWithFrame CGRectMake( 5, 0, 280, 21 )
      end

      def placeholder( value )
        view.placeholder = value
      end

      def clear_button_mode( value )
        view.setClearButtonMode value
      end

      # UITextInputTraits Protocol

      def autocapitalization_type( value )
        view.autocapitalizationType = value
      end

      def autocorrection_type( value )
        view.autocorrectionType = value
      end

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
end
