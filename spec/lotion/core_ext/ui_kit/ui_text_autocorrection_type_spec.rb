describe 'UITextAutocorrectionType' do

  # TODO described_class
  before { @subject = UITextAutocorrectionType }

  it 'is a Lotion::Enum' do
    @subject.is_a?( Lotion::Enum ).should == true
  end
  it 'maps `UITextAutocorrectionTypeDefault`' do
    @subject[ :default ].should == UITextAutocorrectionTypeDefault
  end
  it 'maps `UITextAutocorrectionTypeNo`' do
    @subject[ :no ].should == UITextAutocorrectionTypeNo
  end
  it 'maps `UITextAutocorrectionTypeYes`' do
    @subject[ :yes ].should == UITextAutocorrectionTypeYes
  end
end
