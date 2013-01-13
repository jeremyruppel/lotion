class Hash

  ##
  #
  def reverse_merge( other_hash )
    merge( other_hash ){ |key, oldval, newval| oldval }
  end

  ##
  #
  def reverse_merge!( other_hash )
    merge!( other_hash ){ |key, oldval, newval| oldval }
  end
end
