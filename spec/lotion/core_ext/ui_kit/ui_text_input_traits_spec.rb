describe Lotion::UITextInputTraits do
  subject do
    include Lotion::UITextInputTraits
  end

  before { subject.stub! :view, :return => double( 'view' ) }

  it 'delegates #autocapitalization_type to the view' do
    subject.should delegate [ :autocapitalization_type, :none ] => [ :setAutocapitalizationType, UITextAutocapitalizationTypeNone ]
  end
  it 'delegates #autocorrection_type to the view' do
    subject.should delegate [ :autocorrection_type, :default ] => [ :setAutocorrectionType, UITextAutocorrectionTypeDefault ]
  end
  it 'delegates #enables_return_key_automatically to the view' do
    subject.should delegate [ :enables_return_key_automatically, true ] => [ :setEnablesReturnKeyAutomatically, true ]
  end
  it 'delegates #keyboard_appearance to the view' do
    subject.should delegate [ :keyboard_appearance, :default ] => [ :setKeyboardAppearance, UIKeyboardAppearanceDefault ]
  end
  it 'delegates #keyboard_type to the view' do
    subject.should delegate [ :keyboard_type, :default ] => [ :setKeyboardType, UIKeyboardTypeDefault ]
  end
  it 'delegates #return_key_type to the view' do
    subject.should delegate [ :return_key_type, :default ] => [ :setReturnKeyType, UIReturnKeyDefault ]
  end
  it 'delegates #secure_text_entry to the view' do
    subject.should delegate [ :secure_text_entry, true ] => [ :setSecureTextEntry, true ]
  end
  it 'delegates #spell_checking_type to the view' do
    subject.should delegate [ :spell_checking_type, :default ] => [ :setSpellCheckingType, UITextSpellCheckingTypeDefault ]
  end
end
