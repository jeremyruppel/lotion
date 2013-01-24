describe Lotion::Bundle do

  before do
    @subject = described_class.new
  end

  it 'provides the name of the current bundle' do
    @subject.name.should == 'TestSuite'
  end
  it 'provides the display name of the current bundle' do
    @subject.display_name.should == 'TestSuite'
  end
  it 'provides access to the identifier of the current bundle' do
    @subject.identifier.should == 'com.jeremyruppel.lotion.TestSuite_spec'
  end
  it 'provides the version of the current bundle' do
    @subject.version.should == '0.1.0'
  end
  it 'provides access to other keys in the info dictionary' do
    @subject[ 'CFBundleExecutable' ].should == 'TestSuite'
  end
end

describe Lotion do
  it 'provides access to a bundle' do
    Lotion.bundle.is_a?( Lotion::Bundle ).should == true
  end
end
