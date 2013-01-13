describe Lotion::Form::DataSource do
  subject do
    include Lotion::Form::DataSource
  end

  it 'defines #data' do
    subject.respond_to?( :data ).should == true
  end
  it 'defines #section' do
    subject.respond_to?( :section ).should == true
  end
  it 'adds a table section' do
    lambda { subject.section( 'foo' ){ } }.should.change { subject.data.count }
  end
end
