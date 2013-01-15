describe Lotion::UIFormViewController do
  subject do
    include Lotion::UIFormViewController
  end
  #
  # it 'includes Lotion::Form::Delegate' do
  #   subject.is_a?( Lotion::FormViewController::Delegate ).should == true
  # end
  it 'calls #initWithStyle with the grouped style' do
    subject.mock! 'initWithStyle' do |style|
      style.should == UITableViewStyleGrouped
    end
    subject.init
  end
end
