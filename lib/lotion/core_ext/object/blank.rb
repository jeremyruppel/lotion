# require core_ext/object/try

class Object

  ##
  # If the object is #empty? use that, otherwise check for falsiness.
  def blank?
    try( :empty? ) or !self
  end
end

class NilClass

  ##
  # `nil` is always blank.
  def blank?
    true
  end
end

class String

  ##
  # Strings made up of only whitespace are blank.
  def blank?
    strip.empty?
  end
end
