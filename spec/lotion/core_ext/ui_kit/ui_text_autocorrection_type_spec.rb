describe 'UITextAutocorrectionType' do

  it 'is a Lotion::Enum' do
    described_class.is_a?( Lotion::Enum ).should == true
  end
  it 'maps `UITextAutocorrectionTypeDefault`' do
    described_class[ :default ].should == UITextAutocorrectionTypeDefault
  end
  it 'maps `UITextAutocorrectionTypeNo`' do
    described_class[ :no ].should == UITextAutocorrectionTypeNo
  end
  it 'maps `UITextAutocorrectionTypeYes`' do
    described_class[ :yes ].should == UITextAutocorrectionTypeYes
  end
end
