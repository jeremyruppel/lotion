describe 'UITextAutocapitalizationType' do

  # TODO described_class
  before { @subject = UITextAutocapitalizationType }

  it 'is a Lotion::Enum' do
    @subject.is_a?( Lotion::Enum ).should == true
  end
  it 'maps `UITextAutocapitalizationTypeNone`' do
    @subject[ :none ].should == UITextAutocapitalizationTypeNone
  end
  it 'maps `UITextAutocapitalizationTypeWords`' do
    @subject[ :words ].should == UITextAutocapitalizationTypeWords
  end
  it 'maps `UITextAutocapitalizationTypeSentences`' do
    @subject[ :sentences ].should == UITextAutocapitalizationTypeSentences
  end
  it 'maps `UITextAutocapitalizationTypeAllCharacters`' do
    @subject[ :all_characters ].should == UITextAutocapitalizationTypeAllCharacters
  end
end
