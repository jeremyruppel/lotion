# require core_ext/ui_kit/ui_control_state

module Lotion
  module UIButtonTraits

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

    ##
    # Sets the image to use for the specified state.
    # @see UIControlState
    def image( image, state=:normal )
      view.setImage image, forState:UIControlState[ state ]
    end
  end
end
