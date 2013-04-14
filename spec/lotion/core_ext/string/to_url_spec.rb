describe 'String#to_url' do
  it 'returns an NSURL' do
    'http://example.com'.to_url.should be_an( NSURL )
  end
  it 'has the correct value' do
    url = 'http://example.com'.to_url
    url.absoluteString.should == 'http://example.com'
  end
end
