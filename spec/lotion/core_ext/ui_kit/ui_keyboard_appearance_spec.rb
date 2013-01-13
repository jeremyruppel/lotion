describe 'UIKeyboardAppearance' do

  it 'is a Lotion::Enum' do
    described_class.is_a?( Lotion::Enum ).should == true
  end
  it 'maps `UIKeyboardAppearanceDefault`' do
    described_class[ :default ].should == UIKeyboardAppearanceDefault
  end
  it 'maps `UIKeyboardAppearanceAlert`' do
    described_class[ :alert ].should == UIKeyboardAppearanceAlert
  end
end
