describe Lotion::Application do

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
end
