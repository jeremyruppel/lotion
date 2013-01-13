describe 'UIKeyboardAppearance' do

  # TODO described_class
  before { @subject = UIKeyboardAppearance }

  it 'is a Lotion::Enum' do
    @subject.is_a?( Lotion::Enum ).should == true
  end
  it 'maps `UIKeyboardAppearanceDefault`' do
    @subject[ :default ].should == UIKeyboardAppearanceDefault
  end
  it 'maps `UIKeyboardAppearanceAlert`' do
    @subject[ :alert ].should == UIKeyboardAppearanceAlert
  end
end
