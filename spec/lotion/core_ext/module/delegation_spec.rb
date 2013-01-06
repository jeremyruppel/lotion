describe 'Module#delegate' do

  before do
    @klass = Struct.new :receiver
  end

  it 'exposes the delegate method' do
    @klass.delegate :foo, :to => :receiver
    @klass.new( nil ).should.respond_to( :foo )
  end
  it 'delegates a method to the given receiver' do
    @klass.delegate :foo, :to => :receiver
    @receiver = mock :foo, :return => 'bar'
    @subject  = @klass.new @receiver
    @subject.foo.should == 'bar'
  end
  it 'raises an error if :to is not specified' do
    lambda { @klass.delegate :foo }.should.raise( ArgumentError )
  end
  it 'prefixes the receiver name when :prefix is true' do
    @klass.delegate :foo, :to => :receiver, :prefix => true
    @klass.new( nil ).should.respond_to( :receiver_foo )
  end
  it 'prefixes a custom prefix when :prefix is symbol' do
    @klass.delegate :foo, :to => :receiver, :prefix => :bar
    @klass.new( nil ).should.respond_to( :bar_foo )
  end
end
