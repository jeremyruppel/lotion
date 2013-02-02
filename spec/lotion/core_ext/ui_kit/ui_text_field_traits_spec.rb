describe Lotion::UITextFieldTraits do
  subject do
    include Lotion::UITextFieldTraits
  end

  before { subject.stub! :view, :return => double( 'view' ) }

  it 'delegates #text to the view' do
    subject.should delegate [ :text, :foo ] => [ :setText, :foo ]
  end
  it 'delegates #placeholder to the view' do
    subject.should delegate [ :placeholder, :foo ] => [ :setPlaceholder, :foo ]
  end
  it 'delegates #clear_button_mode to the view' do
    subject.should delegate [ :clear_button_mode, :never ] => [ :setClearButtonMode, UITextFieldViewModeNever ]
  end
end
