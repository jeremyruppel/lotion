describe Lotion::UITextFieldInput do

  before do
    @subject = described_class.new
  end

  it 'has the correct traits' do
    @subject.is_a?( Lotion::UIViewTraits ).should == true
    @subject.is_a?( Lotion::UITextInputTraits ).should == true
    @subject.is_a?( Lotion::UITextFieldTraits ).should == true
  end
  it 'has the correct view class' do
    @subject.view_class.should == UITextField
  end
  it 'uses the text field text as its value' do
    @subject.text 'Sup'
    @subject.value.should == 'Sup'
  end
  it 'blanks its value when cleared' do
    @subject.clear!
    @subject.value.should == nil
  end
  it 'blanks the text field text when cleared' do
    @subject.clear!
    @subject.view.text.should == nil
  end
end
