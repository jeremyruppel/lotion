# require inflector

class String

  ##
  #
  def underscore
    Lotion::Inflector.underscore self
  end

  ##
  #
  def classify
    Lotion::Inflector.classify self
  end

  ##
  #
  def camelize
    Lotion::Inflector.camelize self
  end

  ##
  #
  def pascalize
    Lotion::Inflector.pascalize self
  end

  ##
  #
  def demodulize
    Lotion::Inflector.demodulize self
  end

  ##
  #
  def constantize
    Lotion::Inflector.constantize self
  end
end
