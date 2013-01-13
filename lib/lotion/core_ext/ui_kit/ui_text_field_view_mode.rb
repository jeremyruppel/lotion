UITextFieldViewMode = Lotion::Enum.new do |map|
  map[ :never          ] = UITextFieldViewModeNever
  map[ :while_editing  ] = UITextFieldViewModeWhileEditing
  map[ :unless_editing ] = UITextFieldViewModeUnlessEditing
  map[ :always         ] = UITextFieldViewModeAlways
end
