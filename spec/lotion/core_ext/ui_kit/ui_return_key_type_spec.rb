describe 'UIReturnKeyType' do

  it 'is a Lotion::Enum' do
    described_class.is_a?( Lotion::Enum ).should == true
  end
  it 'maps `UIReturnKeyDefault`' do
    described_class[ :default ].should == UIReturnKeyDefault
  end
  it 'maps `UIReturnKeyGo`' do
    described_class[ :go ].should == UIReturnKeyGo
  end
  it 'maps `UIReturnKeyGoogle`' do
    described_class[ :google ].should == UIReturnKeyGoogle
  end
  it 'maps `UIReturnKeyJoin`' do
    described_class[ :join ].should == UIReturnKeyJoin
  end
  it 'maps `UIReturnKeyNext`' do
    described_class[ :next ].should == UIReturnKeyNext
  end
  it 'maps `UIReturnKeyRoute`' do
    described_class[ :route ].should == UIReturnKeyRoute
  end
  it 'maps `UIReturnKeySearch`' do
    described_class[ :search ].should == UIReturnKeySearch
  end
  it 'maps `UIReturnKeySend`' do
    described_class[ :send ].should == UIReturnKeySend
  end
  it 'maps `UIReturnKeyYahoo`' do
    described_class[ :yahoo ].should == UIReturnKeyYahoo
  end
  it 'maps `UIReturnKeyDone`' do
    described_class[ :done ].should == UIReturnKeyDone
  end
  it 'maps `UIReturnKeyEmergencyCall`' do
    described_class[ :emergency_call ].should == UIReturnKeyEmergencyCall
  end
end
