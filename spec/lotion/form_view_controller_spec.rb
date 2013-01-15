describe Lotion::FormViewController do
  subject do
    include Lotion::FormViewController
  end

  it 'includes Lotion::Form::Delegate' do
    subject.is_a?( Lotion::FormViewController::Delegate ).should == true
  end
  it 'includes Lotion::Form::DataSource' do
    subject.is_a?( Lotion::FormViewController::DataSource ).should == true
  end
  it 'calls #initWithStyle with the grouped style' do
    subject.mock! 'initWithStyle' do |style|
      style.should == UITableViewStyleGrouped
    end
    subject.init
  end
end
