describe 'UIControlContentHorizontalAlignment' do

  it 'is a Lotion::Enum' do
    described_class.is_a?( Lotion::Enum ).should == true
  end
  it 'maps `UIControlContentHorizontalAlignmentCenter`' do
    described_class[ :center ].should == UIControlContentHorizontalAlignmentCenter
  end
  it 'maps `UIControlContentHorizontalAlignmentLeft`' do
    described_class[ :left ].should == UIControlContentHorizontalAlignmentLeft
  end
  it 'maps `UIControlContentHorizontalAlignmentRight`' do
    described_class[ :right ].should == UIControlContentHorizontalAlignmentRight
  end
  it 'maps `UIControlContentHorizontalAlignmentFill`' do
    described_class[ :fill ].should == UIControlContentHorizontalAlignmentFill
  end
end
