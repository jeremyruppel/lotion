describe 'Module#delegate' do

  it 'exposes the delegate method' do
    @klass = Struct.new( :receiver ) do
      delegate :foo, :to => :receiver
    end
    @klass.new( nil ).should.respond_to( :foo )
  end
  it 'delegates a method to the given receiver' do
    @klass = Struct.new( :receiver ) do
      delegate :foo, :to => :receiver
    end
    @receiver = mock :foo, :return => 'bar'
    @subject  = @klass.new @receiver
    @subject.foo.should == 'bar'
  end
end
