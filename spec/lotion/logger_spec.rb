describe Lotion::Logger do
  it 'responds to #info' do
    described_class.new.respond_to?( :info ).should == true
  end
end

describe Lotion do
  it 'provides access to a logger' do
    Lotion.logger.is_a?( Lotion::Logger ).should == true
  end
end
