describe Lotion::Application do

  before do
    @center = NSNotificationCenter.defaultCenter
    @method = 'postNotificationName:object:userInfo'
  end

  subject do
    include Lotion::Application
  end

  it 'defines #screen' do
    subject.screen.should == UIScreen.mainScreen
  end
  it 'defines #bounds' do
    subject.bounds.should be_a( CGRect )
  end
  it 'defines #window' do
    subject.window.should be_a( UIWindow )
  end
  it 'notifies after application startup' do
    options = { :foo => 'bar' }

    @center.mock! @method do |name, from, info|
      name.should == 'application:startup'
      from.should == subject
      info.should == options
    end

    subject.application( nil, didFinishLaunchingWithOptions:options ).should == true
  end
end
