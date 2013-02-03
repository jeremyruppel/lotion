describe Lotion::Naming do
  class FooBarForm < Lotion::Form
  end

  before do
    @subject = FooBarForm.new
  end

  it 'identifies its #class_name' do
    @subject.class_name.should == 'FooBarForm'
  end
  it 'identifies its #class_type' do
    @subject.class_type.should == 'Form'
  end
  it 'identifies its #concern' do
    @subject.concern.should == 'foo_bar'
  end
end
