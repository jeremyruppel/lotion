describe 'Array#extract_options!' do

  it 'returns the options hash' do
    @subject = [ :foo, { :bar => 'baz' } ]
    @subject.extract_options!.should == { :bar => 'baz' }
  end
  it 'modifies the array' do
    @subject = [ :foo, { :bar => 'baz' } ]
    @subject.extract_options!
    @subject.should == [ :foo ]
  end

  it 'returns an empty hash' do
    @subject = [ :foo, :bar ]
    @subject.extract_options!.should == { }
  end
  it 'does not modify the array' do
    @subject = [ :foo, :bar ]
    @subject.extract_options!
    @subject.should == [ :foo, :bar ]
  end
end
