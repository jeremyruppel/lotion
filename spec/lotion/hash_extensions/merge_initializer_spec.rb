describe Lotion::HashExtensions::MergeInitializer do
  before do
    @hash = Class.new( ::Hash ) do
      include Lotion::HashExtensions::MergeInitializer
    end
  end

  it 'merges the hash passed to the constructor' do
    @hash.new( :foo => 'bar', :baz => 'qux' ).should == {
      :foo => 'bar', :baz => 'qux'
    }
  end
  it 'allows the hash default block to be passed' do
    hsh = @hash.new( :foo => 'bar' ){ |h, k| h[ k ] = 'baz' }
    hsh[ :foo ].should == 'bar'
    hsh[ :any ].should == 'baz'
  end
end
