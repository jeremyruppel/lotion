describe 'UIReturnKeyType' do

  # TODO described_class
  before { @subject = UIReturnKeyType }

  it 'is a Lotion::Enum' do
    @subject.is_a?( Lotion::Enum ).should == true
  end
  it 'maps `UIReturnKeyDefault`' do
    @subject[ :default ].should == UIReturnKeyDefault
  end
  it 'maps `UIReturnKeyGo`' do
    @subject[ :go ].should == UIReturnKeyGo
  end
  it 'maps `UIReturnKeyGoogle`' do
    @subject[ :google ].should == UIReturnKeyGoogle
  end
  it 'maps `UIReturnKeyJoin`' do
    @subject[ :join ].should == UIReturnKeyJoin
  end
  it 'maps `UIReturnKeyNext`' do
    @subject[ :next ].should == UIReturnKeyNext
  end
  it 'maps `UIReturnKeyRoute`' do
    @subject[ :route ].should == UIReturnKeyRoute
  end
  it 'maps `UIReturnKeySearch`' do
    @subject[ :search ].should == UIReturnKeySearch
  end
  it 'maps `UIReturnKeySend`' do
    @subject[ :send ].should == UIReturnKeySend
  end
  it 'maps `UIReturnKeyYahoo`' do
    @subject[ :yahoo ].should == UIReturnKeyYahoo
  end
  it 'maps `UIReturnKeyDone`' do
    @subject[ :done ].should == UIReturnKeyDone
  end
  it 'maps `UIReturnKeyEmergencyCall`' do
    @subject[ :emergency_call ].should == UIReturnKeyEmergencyCall
  end
end
