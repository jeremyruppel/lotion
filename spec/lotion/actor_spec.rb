describe Lotion::Actor do

  subject do
    include Lotion::Actor
  end

  it 'includes the correct concerns' do
    subject.should be_a( Lotion::Naming )
    subject.should be_a( Lotion::Notifications )
  end
  it 'responds to #app' do
    subject.should.respond_to :app
  end
  it 'returns the application delegate instance' do
    subject.app.should == UIApplication.sharedApplication.delegate
  end
end
