describe Hash do
  before do
    @foo = { :one => 'from foo', :two   => 'from foo' }
    @bar = { :one => 'from bar', :three => 'from bar' }
  end

  describe '#reverse_merge' do
    it 'merges giving preference to keys on the receiver' do
      @foo.reverse_merge( @bar ).should == {
        :one   => 'from foo',
        :two   => 'from foo',
        :three => 'from bar'
      }
    end
    it 'does not modify the hash in place' do
      lambda { @foo.reverse_merge @bar }.should.not.change { @foo }
    end
  end

  describe '#reverse_merge!' do
    it 'merges in place giving preference to keys on the receiver' do
      @foo.reverse_merge! @bar
      @foo.should == {
        :one   => 'from foo',
        :two   => 'from foo',
        :three => 'from bar'
      }
    end
  end
end
