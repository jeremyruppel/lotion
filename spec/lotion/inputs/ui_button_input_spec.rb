describe Lotion::UIButtonInput do

  before do
    @subject = described_class.new
  end

  it 'has the correct traits' do
    @subject.is_a?( Lotion::UIViewTraits ).should == true
    @subject.is_a?( Lotion::UIControlTraits ).should == true
    @subject.is_a?( Lotion::UIButtonTraits ).should == true
  end
  it 'has the correct view class' do
    @subject.view_class.should == UIButton
  end
  it 'has no value' do
    @subject.value.should == nil
  end
  it 'does not change its value when cleared' do
    @subject.clear!
    @subject.value.should == nil
  end
end
