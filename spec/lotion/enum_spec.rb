describe Lotion::Enum do
  before do
    @subject = Lotion::Enum.new do |map|
      map[ :foo ] = 'Foo!'
      map[ :bar ] = 'Bar!'
    end
  end

  it 'is a Hash' do
    @subject.is_a?( Hash ).should == true
  end
  it 'provides the value for any keys set' do
    @subject[ :foo ].should == 'Foo!'
    @subject[ :bar ].should == 'Bar!'
  end
  it 'passes any set values through' do
    @subject[ 'Foo!' ].should == 'Foo!'
    @subject[ 'Bar!' ].should == 'Bar!'
  end
  it 'raises an exception for undefined values' do
    lambda { @subject[ :baz ] }.should.raise( NameError )
  end
end
