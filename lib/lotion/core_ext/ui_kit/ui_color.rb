class UIColor

  class << self

    # http://cocoamatic.blogspot.com/2010/07/uicolor-macro-with-hex-values.html
    def colorFromHex( value, alpha=1.0 )
      r = ( ( value & 0xFF0000 ) >> 16 ) / 255.0
      g = ( ( value & 0xFF00   ) >> 8  ) / 255.0
      b = ( ( value & 0xFF     )       ) / 255.0
      colorWithRed r, green:g, blue:b, alpha:alpha
    end
  end
end
