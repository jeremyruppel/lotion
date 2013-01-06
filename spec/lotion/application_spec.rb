describe Lotion::Application do
  before do
    @subject = Class.new do
      include Lotion::Application
    end.new
  end

  it 'responds to #app' do
    @subject.should.respond_to :app
  end
  it 'returns the app delegate instance' do
    @subject.app.should == UIApplication.sharedApplication.delegate
  end
end
