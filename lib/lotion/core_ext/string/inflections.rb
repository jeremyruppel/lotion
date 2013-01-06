class String

  def underscore
    gsub( '::', '/' ).gsub( /([a-z])([A-Z])/, '\1_\2' ).downcase
  end

  def demodulize
    split( '::' ).pop
  end
end
