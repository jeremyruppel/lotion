module Lotion
  module UIViewTraits

    ##
    # The frame rectangle, which describes the view’s location
    # and size in its superview’s coordinate system.
    def frame( rect )
      view.setFrame rect
    end
  end
end
