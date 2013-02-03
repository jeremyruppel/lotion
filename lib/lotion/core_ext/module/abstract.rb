class Module

  ##
  # The abstract type for this class. If the class
  # has not been declared abstract, this will be `nil`.
  def abstract_type
    @abstract
  end
  alias :abstract? :abstract_type

  ##
  # Declares this class as an abstract class, optionally
  # specifying the type. If no type is explicitly given,
  # it is inferred from the class name.
  def abstract!( type=nil )
    @abstract = type ? type : to_s.demodulize
  end
end
