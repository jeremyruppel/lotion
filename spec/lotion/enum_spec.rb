describe Lotion::Enum do
  before do
    @subject = Lotion::Enum.new do |map|
      map[ :foo ] = 'Foo!'
      map[ :bar ] = 'Bar!'
    end
  end

  it 'is a Hash' do
    @subject.is_a?( Hash ).should == true
  end
  it 'maps :foo to "Foo!"' do
    @subject[ :foo ].should == 'Foo!'
  end
  it 'maps :bar to "Bar!"' do
    @subject[ :bar ].should == 'Bar!'
  end
  it 'allows any other keys to pass through' do
    @subject[ :baz ].should == :baz
  end
end
