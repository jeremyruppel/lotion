class Hash

  ##
  #
  def extractable_options?
    is_a?( Hash )
  end
end

class Array

  ##
  #
  def extract_options!
    last.extractable_options? ? pop : { }
  end
end
