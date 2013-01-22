describe Hash do
  before do
    @foo = { :one => 'foo', :two => '', :three => nil }
  end

  describe '#compact' do
    it 'removes any keys whose values are `nil`' do
      @foo.compact.should == { :one => 'foo', :two => '' }
    end
    it 'does not modify the receiver' do
      @foo.compact
      @foo.should == { :one => 'foo', :two => '', :three => nil }
    end
  end

  describe '#compact!' do
    it 'removes any keys whose values are `nil`' do
      @foo.compact!.should == { :one => 'foo', :two => '' }
    end
    it 'modifies the receiver' do
      @foo.compact!
      @foo.should == { :one => 'foo', :two => '' }
    end
  end
end
