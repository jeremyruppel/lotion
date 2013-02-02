# require core_ext/ui_kit/ui_control_content_horizontal_alignment
# require core_ext/ui_kit/ui_control_content_vertical_alignment

module Lotion
  module UIControlTraits

    ##
    # The horizontal alignment of content (text or image) within the receiver.
    def content_horizontal_alignment( value )
      view.setContentHorizontalAlignment UIControlContentHorizontalAlignment[ value ]
    end

    ##
    # The vertical alignment of content (text or image) within the receiver.
    def content_vertical_alignment( value )
      view.setContentVerticalAlignment UIControlContentVerticalAlignment[ value ]
    end

    ##
    # A Boolean value that determines whether the receiver is enabled.
    def enabled( value )
      view.setEnabled value
    end

    ##
    # A Boolean value that determines whether the receiver is highlighted.
    def highlighted( value )
      view.setHighlighted value
    end

    ##
    # A Boolean value that determines the receiver’s selected state.
    def selected( value )
      view.setSelected value
    end
  end
end
