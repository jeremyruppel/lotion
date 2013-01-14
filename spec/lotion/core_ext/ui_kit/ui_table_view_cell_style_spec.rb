describe 'UITableViewCellStyle' do

  it 'is a Lotion::Enum' do
    described_class.is_a?( Lotion::Enum ).should == true
  end
  it 'maps `UITableViewCellStyleDefault`' do
    described_class[ :default ].should == UITableViewCellStyleDefault
  end
  it 'maps `UITableViewCellStyleValue1`' do
    described_class[ :value_1 ].should == UITableViewCellStyleValue1
  end
  it 'maps `UITableViewCellStyleValue2`' do
    described_class[ :value_2 ].should == UITableViewCellStyleValue2
  end
  it 'maps `UITableViewCellStyleSubtitle`' do
    described_class[ :subtitle ].should == UITableViewCellStyleSubtitle
  end
end
