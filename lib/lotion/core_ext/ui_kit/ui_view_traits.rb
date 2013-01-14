module Lotion
  module UIViewTraits

    ##
    # An integer that you can use to identify view objects in
    # your application.
    def tag( integer )
      view.setTag integer
    end

    ##
    # The frame rectangle, which describes the view’s location
    # and size in its superview’s coordinate system.
    def frame( rect )
      view.setFrame rect
    end
  end
end
