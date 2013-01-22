describe Lotion::Actor do

  subject do
    include Lotion::Actor
  end

  it 'includes the correct concerns' do
    subject.should be_a( Lotion::Notifications )
  end
  it 'responds to #app' do
    subject.should.respond_to :app
  end
  it 'returns the application delegate instance' do
    subject.app.should == UIApplication.sharedApplication.delegate
  end
end

describe 'naming' do
  class FooBarForm < Lotion::Form
  end

  [ FooBarForm, FooBarForm.new ].each do |subject|
    it 'identifies its #class_name' do
      subject.class_name.should == 'FooBarForm'
    end
    it 'identifies its #class_type' do
      subject.class_type.should == 'Form'
    end
    it 'identifies its #concern' do
      subject.concern.should == 'foo_bar'
    end
  end
end
