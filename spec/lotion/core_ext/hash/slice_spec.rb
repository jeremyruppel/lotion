describe Hash do
  before do
    @subject = { :foo => 'foo', :bar => 'bar', :baz => 'baz' }
  end

  describe '#slice' do
    it 'returns only the keys mentioned' do
      @subject.slice( :foo, :bar ).should == { :foo => 'foo', :bar => 'bar' }
    end
    it 'ignores keys that are not present in the original hash' do
      @subject.slice( :foo, :quux ).should == { :foo => 'foo' }
    end
    it 'does not modify the receiver' do
      @subject.slice( :foo, :bar )
      @subject.should == { :foo => 'foo', :bar => 'bar', :baz => 'baz' }
    end
  end

  describe '#slice!' do
    it 'returns only the keys mentioned' do
      @subject.slice!( :foo, :bar ).should == { :foo => 'foo', :bar => 'bar' }
    end
    it 'ignores keys that are not present in the original hash' do
      @subject.slice!( :foo, :quux ).should == { :foo => 'foo' }
    end
    it 'modifies the the receiver' do
      @subject.slice!( :foo, :bar )
      @subject.should == { :foo => 'foo', :bar => 'bar' }
    end
  end
end
