class Hash

  ##
  # Rejects all key-value pairs from this hash where the value is nil.
  def compact
    reject { |k, v| v.nil? }
  end

  ##
  # Deletes all key-value pairs from this hash where the value is nil.
  def compact!
    delete_if { |k, v| v.nil? }
  end
end
