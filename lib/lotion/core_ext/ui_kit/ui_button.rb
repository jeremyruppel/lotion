# require core_ext/ui_kit/ui_view
# require core_ext/ui_kit/ui_button_type
# require core_ext/ui_kit/ui_control_state

class UIButton

  proxy do

    ##
    # Sets the title to use for the specified state.
    # @see UIControlState
    def title( string, state )
      view.setTitle string, forState:UIControlState[ state ]
    end

    ##
    # Sets the color of the title to use for the specified state.
    # @see UIControlState
    def title_color( color, state )
      view.setTitleColor color, forState:UIControlState[ state ]
    end
  end

  class << self

    ##
    # Override .build to allow for initialization of different
    # buttons types.
    def build( options )
      if options[ :type ]
        buttonWithType UIButtonType[ options[ :type ] ]
      else
        super
      end
    end
  end
end
