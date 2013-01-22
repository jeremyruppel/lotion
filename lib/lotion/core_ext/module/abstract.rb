class Module

  def abstract_type
    @abstract
  end
  alias :abstract? :abstract_type

  def abstract!( name=nil )
    @abstract = name ? name : to_s.demodulize
  end
end
