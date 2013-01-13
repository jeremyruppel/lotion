describe 'UITextFieldViewMode' do

  # TODO described_class
  before { @subject = UITextFieldViewMode }

  it 'is a Lotion::Enum' do
    @subject.is_a?( Lotion::Enum ).should == true
  end
  it 'maps `UITextFieldViewModeNever`' do
    @subject[ :never ].should == UITextFieldViewModeNever
  end
  it 'maps `UITextFieldViewModeWhileEditing`' do
    @subject[ :while_editing ].should == UITextFieldViewModeWhileEditing
  end
  it 'maps `UITextFieldViewModeUnlessEditing`' do
    @subject[ :unless_editing ].should == UITextFieldViewModeUnlessEditing
  end
  it 'maps `UITextFieldViewModeAlways`' do
    @subject[ :always ].should == UITextFieldViewModeAlways
  end
end
