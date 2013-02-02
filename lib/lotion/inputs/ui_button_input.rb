# require input
# require core_ext/ui_kit/ui_view_traits
# require core_ext/ui_kit/ui_button_traits
# require core_ext/ui_kit/ui_button_type

module Lotion
  class UIButtonInput < Lotion::Input
    include Lotion::UIViewTraits
    include Lotion::UIButtonTraits

    ##
    #
    def value
      nil
    end

    ##
    #
    def view_class
      UIButton
    end

    ##
    #
    def clear!
      nil
    end

    ##
    # By default, button inputs are rounded rect type buttons.
    def build
      view_class.buttonWithType UIButtonType[ :rounded_rect ]
    end
  end
end
