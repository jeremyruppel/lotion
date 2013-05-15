describe Lotion::Command do

  before do
    # TODO this mock syntax blows.
    @notification = stub( :name, :return => 'foo' )
    @command = Class.new( Lotion::Command ) do
      def call; name.reverse; end
    end
    @subject = @command.new @notification
  end

  it 'includes the correct concerns' do
    @subject.should be_a( Lotion::Notifications )
  end
  it 'responds to #notification' do
    @subject.should.respond_to :notification
  end
  it 'exposes the correct notification methods' do
    @subject.notification.mock! :name,     :return => 'foo'
    @subject.notification.mock! :object,   :return => 'bar'
    @subject.notification.mock! :userInfo, :return => 'baz'

    @subject.name.should      == 'foo'
    @subject.object.should    == 'bar'
    @subject.userInfo.should  == 'baz'
  end
  it 'treats .call as a factory method' do
    @command.call( @notification ).should == 'oof'
  end
  it 'expects subclasses to override #call' do
    lambda { Lotion::Command.new( @notification ).call }.should.raise( NotImplementedError )
  end
end
