describe Lotion::Notifications do

  subject do
    include Lotion::Notifications
  end
  before do
    @center = subject.notification_center
    @method = 'postNotificationName:object:userInfo'
  end
  it 'has the correct notification center' do
    subject.notification_center.should == NSNotificationCenter.defaultCenter
  end
  it 'responds to #notify' do
    subject.should.respond_to :notify
  end
  it 'sends a notification to the notification center' do
    @center.mock! @method do |name, from, info|
      name.should == 'foo'
      from.should == subject
      info.should == nil
    end
    subject.notify 'foo'
  end
  it 'passes along the user info hash to the notification center' do
    @center.mock! @method do |name, from, info|
      name.should == 'foo'
      from.should == subject
      info.should == { :foo => 'bar' }
    end
    subject.notify 'foo', :foo => 'bar'
  end
end
