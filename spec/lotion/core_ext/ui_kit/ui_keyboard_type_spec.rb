describe 'UIKeyboardType' do
  
  # TODO described_class
  before { @subject = UIKeyboardType }

  it 'is a Lotion::Enum' do
    @subject.is_a?( Lotion::Enum ).should == true
  end
  it 'maps `UIKeyboardTypeDefault`' do
    @subject[ :default ].should == UIKeyboardTypeDefault
  end
  it 'maps `UIKeyboardTypeASCIICapable`' do
    @subject[ :ascii_capable ].should == UIKeyboardTypeASCIICapable
  end
  it 'maps `UIKeyboardTypeNumbersAndPunctuation`' do
    @subject[ :numbers_and_punctuation ].should == UIKeyboardTypeNumbersAndPunctuation
  end
  it 'maps `UIKeyboardTypeURL`' do
    @subject[ :url ].should == UIKeyboardTypeURL
  end
  it 'maps `UIKeyboardTypeNumberPad`' do
    @subject[ :number_pad ].should == UIKeyboardTypeNumberPad
  end
  it 'maps `UIKeyboardTypePhonePad`' do
    @subject[ :phone_pad ].should == UIKeyboardTypePhonePad
  end
  it 'maps `UIKeyboardTypeNamePhonePad`' do
    @subject[ :name_phone_pad ].should == UIKeyboardTypeNamePhonePad
  end
  it 'maps `UIKeyboardTypeEmailAddress`' do
    @subject[ :email_address ].should == UIKeyboardTypeEmailAddress
  end
  it 'maps `UIKeyboardTypeDecimalPad`' do
    @subject[ :decimal_pad ].should == UIKeyboardTypeDecimalPad
  end
  it 'maps `UIKeyboardTypeTwitter`' do
    @subject[ :twitter ].should == UIKeyboardTypeTwitter
  end
  it 'maps `UIKeyboardTypeAlphabet`' do
    @subject[ :alphabet ].should == UIKeyboardTypeAlphabet
  end
end
