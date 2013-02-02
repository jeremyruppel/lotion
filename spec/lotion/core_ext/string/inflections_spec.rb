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

describe 'String#classify' do

  it 'upcases a string' do
    'foo'.classify.should == 'Foo'
  end
  it 'removes underscores and capitalizes letters afterwards' do
    'foo_bar'.classify.should == 'FooBar'
  end
  it 'converts "/" to "::"' do
    'foo/bar'.classify.should == 'Foo::Bar'
  end
end

describe 'String#camelize' do

  it 'capitalizes a lowercase string' do
    'foo'.camelize.should == 'Foo'
  end
  it 'camel-cases a string with underscores' do
    'foo_bar'.camelize.should == 'FooBar'
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

describe 'String#constantize' do

  it 'returns the constant if the constant is defined' do
    'Lotion::Application'.constantize.should == Lotion::Application
  end
  it 'raises a NameError if the constant is not defined' do
    lambda { 'Foo::Bar'.constantize }.should.raise( NameError )
  end
end
