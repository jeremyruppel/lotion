class String

  ##
  # Returns a new NSURL populated with this string.
  def to_url
    NSURL.URLWithString self
  end
end
