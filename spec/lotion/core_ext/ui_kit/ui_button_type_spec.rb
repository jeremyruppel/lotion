describe 'UIButtonType' do

  it 'is a Lotion::Enum' do
    described_class.is_a?( Lotion::Enum ).should == true
  end
  it 'maps `UIButtonTypeCustom`' do
    described_class[ :custom ].should == UIButtonTypeCustom
  end
  it 'maps `UIButtonTypeRoundedRect`' do
    described_class[ :rounded_rect ].should == UIButtonTypeRoundedRect
  end
  it 'maps `UIButtonTypeDetailDisclosure`' do
    described_class[ :detail_disclosure ].should == UIButtonTypeDetailDisclosure
  end
  it 'maps `UIButtonTypeInfoLight`' do
    described_class[ :info_light ].should == UIButtonTypeInfoLight
  end
  it 'maps `UIButtonTypeInfoDark`' do
    described_class[ :info_dark ].should == UIButtonTypeInfoDark
  end
  it 'maps `UIButtonTypeContactAdd`' do
    described_class[ :contact_add ].should == UIButtonTypeContactAdd
  end
end
