describe 'UIKeyboardType' do

  it 'is a Lotion::Enum' do
    described_class.is_a?( Lotion::Enum ).should == true
  end
  it 'maps `UIKeyboardTypeDefault`' do
    described_class[ :default ].should == UIKeyboardTypeDefault
  end
  it 'maps `UIKeyboardTypeASCIICapable`' do
    described_class[ :ascii_capable ].should == UIKeyboardTypeASCIICapable
  end
  it 'maps `UIKeyboardTypeNumbersAndPunctuation`' do
    described_class[ :numbers_and_punctuation ].should == UIKeyboardTypeNumbersAndPunctuation
  end
  it 'maps `UIKeyboardTypeURL`' do
    described_class[ :url ].should == UIKeyboardTypeURL
  end
  it 'maps `UIKeyboardTypeNumberPad`' do
    described_class[ :number_pad ].should == UIKeyboardTypeNumberPad
  end
  it 'maps `UIKeyboardTypePhonePad`' do
    described_class[ :phone_pad ].should == UIKeyboardTypePhonePad
  end
  it 'maps `UIKeyboardTypeNamePhonePad`' do
    described_class[ :name_phone_pad ].should == UIKeyboardTypeNamePhonePad
  end
  it 'maps `UIKeyboardTypeEmailAddress`' do
    described_class[ :email_address ].should == UIKeyboardTypeEmailAddress
  end
  it 'maps `UIKeyboardTypeDecimalPad`' do
    described_class[ :decimal_pad ].should == UIKeyboardTypeDecimalPad
  end
  it 'maps `UIKeyboardTypeTwitter`' do
    described_class[ :twitter ].should == UIKeyboardTypeTwitter
  end
  it 'maps `UIKeyboardTypeAlphabet`' do
    described_class[ :alphabet ].should == UIKeyboardTypeAlphabet
  end
end
