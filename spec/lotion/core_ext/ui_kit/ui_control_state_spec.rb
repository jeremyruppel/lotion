describe 'UIControlState' do

  it 'is a Lotion::Enum' do
    described_class.is_a?( Lotion::Enum ).should == true
  end
  it 'maps `UIControlStateNormal`' do
    described_class[ :normal ].should == UIControlStateNormal
  end
  it 'maps `UIControlStateHighlighted`' do
    described_class[ :highlighted ].should == UIControlStateHighlighted
  end
  it 'maps `UIControlStateDisabled`' do
    described_class[ :disabled ].should == UIControlStateDisabled
  end
  it 'maps `UIControlStateSelected`' do
    described_class[ :selected ].should == UIControlStateSelected
  end
  it 'maps `UIControlStateApplication`' do
    described_class[ :application ].should == UIControlStateApplication
  end
  it 'maps `UIControlStateReserved`' do
    described_class[ :reserved ].should == UIControlStateReserved
  end
end
