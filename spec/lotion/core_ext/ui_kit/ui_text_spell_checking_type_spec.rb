describe 'UITextSpellCheckingType' do
  
  # TODO described_class
  before { @subject = UITextSpellCheckingType }
  
  it 'is a Lotion::Enum' do
    @subject.is_a?( Lotion::Enum ).should == true
  end
  it 'maps `UITextSpellCheckingTypeDefault`' do
    @subject[ :default ].should == UITextSpellCheckingTypeDefault
  end
  it 'maps `UITextSpellCheckingTypeNo`' do
    @subject[ :no ].should == UITextSpellCheckingTypeNo
  end
  it 'maps `UITextSpellCheckingTypeYes`' do
    @subject[ :yes ].should == UITextSpellCheckingTypeYes
  end
end
