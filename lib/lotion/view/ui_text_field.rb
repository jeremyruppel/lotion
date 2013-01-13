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

      def autocorrection_type( value )
        view.autocorrectionType = value
      end

      def clear_button_mode( value )
        view.setClearButtonMode value
      end

      def secure_text_entry( value )
        view.secureTextEntry = value
      end
    end
  end
end
