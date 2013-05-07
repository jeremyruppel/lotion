describe Lotion::Command do

  subject Lotion::Command do
    def call; name.reverse; end
  end

  it 'includes the correct concerns' do
    subject.should be_a( Lotion::Notifications )
  end
  it 'responds to #notification' do
    subject.should.respond_to :notification
  end
  it 'exposes the correct notification methods' do
    subject.notification.mock! :name,     :return => 'foo'
    subject.notification.mock! :object,   :return => 'bar'
    subject.notification.mock! :userInfo, :return => 'baz'

    subject.name.should      == 'foo'
    subject.object.should    == 'bar'
    subject.userInfo.should  == 'baz'
  end
  it 'treats .call as a factory method' do
    notification = mock :name, :return => 'foo'
    subject.class.call( notification ).should == 'oof'
  end
  it 'expects subclasses to override #call' do
    lambda { Lotion::Command.new.call }.should.raise( NotImplementedError )
  end
end
