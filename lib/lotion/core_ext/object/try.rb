class Object

  ##
  # Encapsulates the pattern of checking `respond_to?` before
  # calling a method. Useful for the iOS delegate pattern.
  def try( method, *args, &block )
    respond_to?( method ) ? send( method, *args, &block ) : nil
  end
end

class NilClass

  ##
  # `nil` always returns `nil` so that multiple calls to #try may
  # be chained together.
  def try( method, *args, &block )
    self
  end
end
