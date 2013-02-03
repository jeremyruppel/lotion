describe Lotion::LengthValidator do
  before do
    @subject = described_class.new :maximum => 2, :minimum => 2
    @errors  = Hash.new { |h, k| h[ k ] = [ ] }
  end

  it 'adds an error if the value length is more than maximum' do
    @subject.validate 'aaa', :foo, @errors
    @errors.should == { :foo => [ 'is too long' ] }
  end
  it 'adds an error if the value length is less than minimum' do
    @subject.validate 'a', :foo, @errors
    @errors.should == { :foo => [ 'is too short' ] }
  end
  it 'does not add an error if the value length is within the maximum and minimum' do
    @subject.validate 'aa', :foo, @errors
    @errors.should == { }
  end
end
