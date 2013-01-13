describe Lotion::Form do
  subject do
    include Lotion::Form
  end

  it 'includes Lotion::Form::Delegate' do
    subject.is_a?( Lotion::Form::Delegate ).should == true
  end
  it 'includes Lotion::Form::DataSource' do
    subject.is_a?( Lotion::Form::DataSource ).should == true
  end
  it 'calls #initWithStyle with the grouped style' do
    subject.mock! 'initWithStyle' do |style|
      style.should == UITableViewStyleGrouped
    end
    subject.init
  end
end
