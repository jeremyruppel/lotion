describe Lotion::UITextInputTraits do
  subject do
    include Lotion::UITextInputTraits
  end

  before { subject.stub! :view, :return => double( 'view' ) }

  it 'delegates #autocapitalization_type to the view' do
    subject.view.mock! :setAutocapitalizationType do |arg|
      arg.should == :foo
    end
    subject.autocapitalization_type :foo
  end
  it 'delegates #autocorrection_type to the view' do
    subject.view.mock! :setAutocorrectionType do |arg|
      arg.should == :foo
    end
    subject.autocorrection_type :foo
  end
  it 'delegates #enables_return_key_automatically to the view' do
    subject.view.mock! :setEnablesReturnKeyAutomatically do |arg|
      arg.should == :foo
    end
    subject.enables_return_key_automatically :foo
  end
  it 'delegates #keyboard_appearance to the view' do
    subject.view.mock! :setKeyboardAppearance do |arg|
      arg.should == :foo
    end
    subject.keyboard_appearance :foo
  end
  it 'delegates #keyboard_type to the view' do
    subject.view.mock! :setKeyboardType do |arg|
      arg.should == :foo
    end
    subject.keyboard_type :foo
  end
  it 'delegates #return_key_type to the view' do
    subject.view.mock! :setReturnKeyType do |arg|
      arg.should == :foo
    end
    subject.return_key_type :foo
  end
  it 'delegates #secure_text_entry to the view' do
    subject.view.mock! :setSecureTextEntry do |arg|
      arg.should == :foo
    end
    subject.secure_text_entry :foo
  end
  it 'delegates #spell_checking_type to the view' do
    subject.view.mock! :setSpellCheckingType do |arg|
      arg.should == :foo
    end
    subject.spell_checking_type :foo
  end
end
