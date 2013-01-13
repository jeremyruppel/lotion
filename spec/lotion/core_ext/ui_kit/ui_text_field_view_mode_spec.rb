describe 'UITextFieldViewMode' do

  it 'is a Lotion::Enum' do
    described_class.is_a?( Lotion::Enum ).should == true
  end
  it 'maps `UITextFieldViewModeNever`' do
    described_class[ :never ].should == UITextFieldViewModeNever
  end
  it 'maps `UITextFieldViewModeWhileEditing`' do
    described_class[ :while_editing ].should == UITextFieldViewModeWhileEditing
  end
  it 'maps `UITextFieldViewModeUnlessEditing`' do
    described_class[ :unless_editing ].should == UITextFieldViewModeUnlessEditing
  end
  it 'maps `UITextFieldViewModeAlways`' do
    described_class[ :always ].should == UITextFieldViewModeAlways
  end
end
