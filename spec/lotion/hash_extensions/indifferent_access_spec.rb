describe Lotion::HashExtensions::IndifferentAccess do
  subject Hash do
    include Lotion::HashExtensions::IndifferentAccess
  end

  it 'acknowledges symbol keys as strings' do
    subject[ :foo ] = 'bar'
    subject.has_key?( :foo ).should == true
  end
  it 'can access symbol keys as strings' do
    subject[ :foo  ] = 'bar'
    subject[ 'foo' ].should == 'bar'
  end
  it 'acknowledges string keys as symbols' do
    subject[ 'foo' ] = 'bar'
    subject.has_key?( :foo ).should == true
  end
  it 'can access string keys as symbols' do
    subject[ 'foo' ] = 'bar'
    subject[ :foo  ].should == 'bar'
  end
end
