describe 'UITextSpellCheckingType' do

  it 'is a Lotion::Enum' do
    described_class.is_a?( Lotion::Enum ).should == true
  end
  it 'maps `UITextSpellCheckingTypeDefault`' do
    described_class[ :default ].should == UITextSpellCheckingTypeDefault
  end
  it 'maps `UITextSpellCheckingTypeNo`' do
    described_class[ :no ].should == UITextSpellCheckingTypeNo
  end
  it 'maps `UITextSpellCheckingTypeYes`' do
    described_class[ :yes ].should == UITextSpellCheckingTypeYes
  end
end
