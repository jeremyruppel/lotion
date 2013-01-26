describe Lotion::Input do

  before do
    @subject = described_class.new
  end

  it 'expects subclasses to override #view_class' do
    lambda { @subject.view_class }.should.raise( NotImplementedError )
  end
  it 'expects subclasses to override #value' do
    lambda { @subject.value }.should.raise( NotImplementedError )
  end
  it 'expects subclasses to override #clear!' do
    lambda { @subject.clear! }.should.raise( NotImplementedError )
  end
end
