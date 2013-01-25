describe Lotion::HashExtensions::MethodAccess do
  subject Hash do
    include Lotion::HashExtensions::MethodAccess
  end

  it 'allows method access to symbol keys' do
    subject[ :foo ] = 'bar'
    subject.foo.should == 'bar'
  end
  it 'does not allow method access to string keys' do
    subject[ 'foo' ] = 'bar'
    lambda { subject.foo }.should.raise( NoMethodError )
  end
  it 'allows method access to string keys when indifferent' do
    subject.extend Lotion::HashExtensions::IndifferentAccess
    subject[ 'foo' ] = 'bar'
    subject.foo.should == 'bar'
  end
end
