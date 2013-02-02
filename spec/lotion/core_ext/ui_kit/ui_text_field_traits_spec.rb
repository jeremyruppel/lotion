describe Lotion::UITextFieldTraits do
  subject do
    include Lotion::UITextFieldTraits
  end

  before { subject.stub! :view, :return => double( 'view' ) }

  it 'delegates #text to the view' do
    subject.should delegate [ :setText, :foo ] => [ :text, :foo ]
  end
  it 'delegates #placeholder to the view' do
    subject.should delegate [ :setPlaceholder, :foo ] => [ :placeholder, :foo ]
  end
  it 'delegates #clear_button_mode to the view' do
    subject.should delegate [ :setClearButtonMode, UITextFieldViewModeNever ] => [ :clear_button_mode, :never ]
  end
end
