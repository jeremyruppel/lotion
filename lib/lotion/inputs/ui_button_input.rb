# require input
# require core_ext/ui_kit/ui_view_traits
# require core_ext/ui_kit/ui_button_type
# require core_ext/ui_kit/ui_control_state

# TODO needs specs
module Lotion
  class UIButtonInput < Lotion::Input
    include Lotion::UIViewTraits

    def value
      nil
    end

    def view_class
      UIButton
    end

    def clear!
      nil
    end

    ##
    # Sets the title to use for the specified state.
    # @see UIControlState
    def title( string, state=:normal )
      view.setTitle string, forState:UIControlState[ state ]
    end

    ##
    # Sets the color of the title to use for the specified state.
    # @see UIControlState
    def title_color( color, state=:normal )
      view.setTitleColor color, forState:UIControlState[ state ]
    end
  end
end
