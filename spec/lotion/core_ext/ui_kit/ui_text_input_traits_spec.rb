describe Lotion::UITextInputTraits do
  subject do
    include Lotion::UITextInputTraits
  end

  before { subject.stub! :view, :return => double( 'view' ) }

  it 'delegates #autocapitalization_type to the view' do
    subject.view.mock! :setAutocapitalizationType do |arg|
      arg.should == UITextAutocapitalizationTypeNone
    end
    subject.autocapitalization_type :none
  end
  it 'delegates #autocorrection_type to the view' do
    subject.view.mock! :setAutocorrectionType do |arg|
      arg.should == UITextAutocorrectionTypeDefault
    end
    subject.autocorrection_type :default
  end
  it 'delegates #enables_return_key_automatically to the view' do
    subject.view.mock! :setEnablesReturnKeyAutomatically do |arg|
      arg.should == true
    end
    subject.enables_return_key_automatically true
  end
  it 'delegates #keyboard_appearance to the view' do
    subject.view.mock! :setKeyboardAppearance do |arg|
      arg.should == UIKeyboardAppearanceDefault
    end
    subject.keyboard_appearance :default
  end
  it 'delegates #keyboard_type to the view' do
    subject.view.mock! :setKeyboardType do |arg|
      arg.should == UIKeyboardTypeDefault
    end
    subject.keyboard_type :default
  end
  it 'delegates #return_key_type to the view' do
    subject.view.mock! :setReturnKeyType do |arg|
      arg.should == UIReturnKeyDefault
    end
    subject.return_key_type :default
  end
  it 'delegates #secure_text_entry to the view' do
    subject.view.mock! :setSecureTextEntry do |arg|
      arg.should == true
    end
    subject.secure_text_entry true
  end
  it 'delegates #spell_checking_type to the view' do
    subject.view.mock! :setSpellCheckingType do |arg|
      arg.should == UITextSpellCheckingTypeDefault
    end
    subject.spell_checking_type :default
  end
end
