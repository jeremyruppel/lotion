describe 'UIControlContentVerticalAlignment' do

  it 'is a Lotion::Enum' do
    described_class.is_a?( Lotion::Enum ).should == true
  end
  it 'maps `UIControlContentVerticalAlignmentCenter`' do
    described_class[ :center ].should == UIControlContentVerticalAlignmentCenter
  end
  it 'maps `UIControlContentVerticalAlignmentTop`' do
    described_class[ :top ].should == UIControlContentVerticalAlignmentTop
  end
  it 'maps `UIControlContentVerticalAlignmentBottom`' do
    described_class[ :bottom ].should == UIControlContentVerticalAlignmentBottom
  end
  it 'maps `UIControlContentVerticalAlignmentFill`' do
    described_class[ :fill ].should == UIControlContentVerticalAlignmentFill
  end
end
