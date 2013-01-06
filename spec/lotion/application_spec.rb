describe Lotion::Application do

  before do
    @subject = Class.new do
      include Lotion::Application
    end.new
  end

  def be_a( klass )
    lambda { |obj| obj.is_a?( klass ) }
  end
  alias :be_an :be_a

  it 'defines #screen' do
    @subject.screen.should == UIScreen.mainScreen
  end
  it 'defines #bounds' do
    @subject.bounds.should be_a( CGRect )
  end
  it 'defines #window' do
    @subject.window.should be_a( UIWindow )
  end
end
