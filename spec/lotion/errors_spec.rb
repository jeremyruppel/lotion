describe Lotion::Errors do

  before do
    @subject = described_class.new
  end

  it 'is a hash' do
    @subject.should be_a( Hash )
  end
  it 'sets missing keys to an empty array by default' do
    @subject[ :foo ] << :bar
    @subject[ :foo ].should == [ :bar ]
  end
  it 'produces an array of full messages' do
    @subject[ :name ] << 'is too short'
    @subject[ :name ] << 'is too long'
    @subject[ :beer ] << 'is empty'
    @subject.full_messages.should == [
      'Name is too short',
      'Name is too long',
      'Beer is empty'
    ]
  end
end
