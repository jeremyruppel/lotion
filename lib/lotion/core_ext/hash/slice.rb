class Hash

  ##
  # Returns a new hash with only the specified keys.
  def slice( *keys )
    select { |k, v| keys.include? k }
  end

  ##
  # Returns a new hash with only the specified keys.
  def slice!( *keys )
    keep_if { |k, v| keys.include? k }
  end
end
