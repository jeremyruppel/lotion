describe Lotion::PresenceValidator do
  before do
    @subject = described_class.new
    @errors  = Hash.new { |h, k| h[ k ] = [ ] }
  end

  it 'adds an error if the value is #blank?' do
    @subject.validate nil, :foo, @errors
    @errors.should == { :foo => [ 'is blank' ] }
  end
  it 'does not add an error if the value is not #blank?' do
    @subject.validate 'Sup', :foo, @errors
    @errors.should == { }
  end
end
