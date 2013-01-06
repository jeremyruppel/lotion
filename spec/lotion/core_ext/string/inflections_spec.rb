describe 'String#underscore' do

  it 'downcases a string' do
    'Foo'.underscore.should == 'foo'
  end
  it 'inserts underscores between uppercased letters' do
    'FooBar'.underscore.should == 'foo_bar'
  end
  it 'converts "::" to "/"' do
    'Foo::Bar'.underscore.should == 'foo/bar'
  end
end

describe 'String#demodulize' do

  it 'removes the module portion of a string' do
    'Foo::Bar'.demodulize.should == 'Bar'
  end
  it 'returns the string if no module is present' do
    'Foo'.demodulize.should == 'Foo'
  end
end
