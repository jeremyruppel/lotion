class String

  ##
  #
  def underscore
    gsub( '::', '/' ).gsub( /([a-z])([A-Z])/, '\1_\2' ).downcase
  end

  ##
  #
  def classify
    camelize.gsub( /\/([a-zA-Z])/ ){ |m| "::#{$1.upcase}" }
  end

  ##
  #
  def camelize
    capitalize.gsub( /_([a-zA-Z])/ ){ |m| $1.upcase }
  end

  ##
  #
  def demodulize
    split( '::' ).pop
  end

  ##
  #
  def constantize
    split( '::' ).reduce( Kernel ) do |memo, name|
      memo.const_get name
    end
  end
end
