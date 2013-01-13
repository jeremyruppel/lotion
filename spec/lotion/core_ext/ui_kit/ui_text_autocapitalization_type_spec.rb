describe 'UITextAutocapitalizationType' do

  it 'is a Lotion::Enum' do
    described_class.is_a?( Lotion::Enum ).should == true
  end
  it 'maps `UITextAutocapitalizationTypeNone`' do
    described_class[ :none ].should == UITextAutocapitalizationTypeNone
  end
  it 'maps `UITextAutocapitalizationTypeWords`' do
    described_class[ :words ].should == UITextAutocapitalizationTypeWords
  end
  it 'maps `UITextAutocapitalizationTypeSentences`' do
    described_class[ :sentences ].should == UITextAutocapitalizationTypeSentences
  end
  it 'maps `UITextAutocapitalizationTypeAllCharacters`' do
    described_class[ :all_characters ].should == UITextAutocapitalizationTypeAllCharacters
  end
end
