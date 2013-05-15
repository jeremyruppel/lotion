#= require lotion/application

describe Lotion::Application do

  subject do
    include Lotion::Application
  end
  before do
    @center = subject.notification_center
  end
  it 'includes the correct concerns' do
    subject.should be_a( Lotion::Notifications )
  end
  it 'defines #screen' do
    subject.screen.should == UIScreen.mainScreen
  end
  it 'defines #window' do
    subject.window.should be_a( UIWindow )
  end
  it 'defined #views' do
    subject.views.should be_a( Hash )
  end
  it 'notifies after application startup' do
    options = { :foo => 'bar' }

    @center.mock! 'postNotificationName:object:userInfo:' do |name, from, info|
      name.should == 'application:startup'
      from.should == subject
      info.should == options
    end

    subject.application( nil, didFinishLaunchingWithOptions:options ).should == true
  end
  it 'responds to #on' do
    subject.should.respond_to :on
  end
  it 'attaches commands to notifications' do
    command = stub :call, :return => true

    @center.mock! 'addObserver:selector:name:object:' do |klass, selector, name, object|
      klass.should    == command
      selector.should == 'call:'
      name.should     == 'foo'
      object.should   == nil
    end

    subject.on 'foo', command
  end
end
