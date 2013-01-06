describe Lotion::Actor do

  subject do
    include Lotion::Actor
  end

  it 'responds to #app' do
    subject.should.respond_to :app
  end
  it 'returns the application delegate instance' do
    subject.app.should == UIApplication.sharedApplication.delegate
  end
end
