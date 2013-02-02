describe Lotion::UITextInputTraits do
  subject do
    include Lotion::UITextInputTraits
  end

  before { subject.stub! :view, :return => double( 'view' ) }

  it 'delegates #autocapitalization_type to the view' do
    subject.should delegate [ :setAutocapitalizationType, UITextAutocapitalizationTypeNone ] => [ :autocapitalization_type, :none ]
  end
  it 'delegates #autocorrection_type to the view' do
    subject.should delegate [ :setAutocorrectionType, UITextAutocorrectionTypeDefault ] => [ :autocorrection_type, :default ]
  end
  it 'delegates #enables_return_key_automatically to the view' do
    subject.should delegate [ :setEnablesReturnKeyAutomatically, true ] => [ :enables_return_key_automatically, true ]
  end
  it 'delegates #keyboard_appearance to the view' do
    subject.should delegate [ :setKeyboardAppearance, UIKeyboardAppearanceDefault ] => [ :keyboard_appearance, :default ]
  end
  it 'delegates #keyboard_type to the view' do
    subject.should delegate [ :setKeyboardType, UIKeyboardTypeDefault ] => [ :keyboard_type, :default ]
  end
  it 'delegates #return_key_type to the view' do
    subject.should delegate [ :setReturnKeyType, UIReturnKeyDefault ] => [ :return_key_type, :default ]
  end
  it 'delegates #secure_text_entry to the view' do
    subject.should delegate [ :setSecureTextEntry, true ] => [ :secure_text_entry, true ]
  end
  it 'delegates #spell_checking_type to the view' do
    subject.should delegate [ :setSpellCheckingType, UITextSpellCheckingTypeDefault ] => [ :spell_checking_type, :default ]
  end
end
