describe Lotion::Inflector do

  describe '.underscore' do

    it 'downcases a string' do
      Lotion::Inflector.underscore( 'Foo' ).should == 'foo'
    end
    it 'inserts underscores between uppercased letters' do
      Lotion::Inflector.underscore( 'FooBar' ).should == 'foo_bar'
    end
    it 'converts "::" to "/"' do
      Lotion::Inflector.underscore( 'Foo::Bar' ).should == 'foo/bar'
    end
  end

  describe '.classify' do

    it 'upcases a string' do
      Lotion::Inflector.classify( 'foo' ).should == 'Foo'
    end
    it 'removes underscores and capitalizes letters afterwards' do
      Lotion::Inflector.classify( 'foo_bar' ).should == 'FooBar'
    end
    it 'converts "/" to "::"' do
      Lotion::Inflector.classify( 'foo/bar' ).should == 'Foo::Bar'
    end
  end

  describe '.camelize' do

    it 'does not capitalize a lowercase string' do
      Lotion::Inflector.camelize( 'foo' ).should == 'foo'
    end
    it 'camel-cases a string with underscores' do
      Lotion::Inflector.camelize( 'foo_bar' ).should == 'fooBar'
    end
    it 'preserves method suffixes' do
      Lotion::Inflector.camelize( 'foo=' ).should == 'foo='
      Lotion::Inflector.camelize( 'foo!' ).should == 'foo!'
      Lotion::Inflector.camelize( 'foo?' ).should == 'foo?'
    end
  end

  describe '.pascalize' do

    it 'capitalizes a lowercase string' do
      Lotion::Inflector.pascalize( 'foo' ).should == 'Foo'
    end
    it 'pascal-cases a string with underscores' do
      Lotion::Inflector.pascalize( 'foo_bar' ).should == 'FooBar'
    end
    it 'preserves method suffixes' do
      Lotion::Inflector.pascalize( 'foo=' ).should == 'Foo='
      Lotion::Inflector.pascalize( 'foo!' ).should == 'Foo!'
      Lotion::Inflector.pascalize( 'foo?' ).should == 'Foo?'
    end
  end

  describe '.demodulize' do

    it 'removes the module portion of a string' do
      Lotion::Inflector.demodulize( 'Foo::Bar' ).should == 'Bar'
    end
    it 'returns the string if no module is present' do
      Lotion::Inflector.demodulize( 'Foo' ).should == 'Foo'
    end
  end

  describe '.constantize' do

    it 'returns the constant if the constant is defined' do
      Lotion::Inflector.constantize( 'Lotion::Application' ).should == Lotion::Application
    end
    it 'raises a NameError if the constant is not defined' do
      lambda { Lotion::Inflector.constantize( 'Foo::Bar' ) }.should.raise( NameError )
    end
  end

end
