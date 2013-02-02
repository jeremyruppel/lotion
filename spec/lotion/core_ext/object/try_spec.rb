describe 'Object#try' do

  before do
    @subject = Object.new
  end
  it 'calls the method if the receiver responds to it' do
    @subject.try( :class ).should == Object
  end
  it 'returns nil if the receiver does not respond to the method' do
    @subject.try( :asdfg ).should == nil
  end
end
describe 'NilClass#try' do
  it 'always returns `nil`' do
    nil.try( :to_s ).should == nil
  end
end
