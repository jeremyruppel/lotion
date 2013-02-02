describe Lotion::UIControlTraits do
  subject do
    include Lotion::UIControlTraits
  end

  before { subject.stub! :view, :return => double( 'view' ) }

  it 'delegates #content_horizontal_alignment to the view' do
    subject.should delegate [ :content_horizontal_alignment, :center ] => [ :setContentHorizontalAlignment, UIControlContentHorizontalAlignmentCenter ]
  end
  it 'delegates #content_vertical_alignment to the view' do
    subject.should delegate [ :content_vertical_alignment, :center ] => [ :setContentVerticalAlignment, UIControlContentVerticalAlignmentCenter ]
  end
  it 'delegates #enabled to the view' do
    subject.should delegate [ :enabled, true ] => [ :setEnabled, true ]
  end
  it 'delegates #highlighted to the view' do
    subject.should delegate [ :highlighted, true ] => [ :setHighlighted, true ]
  end
  it 'delegates #selected to the view' do
    subject.should delegate [ :selected, true ] => [ :setSelected, true ]
  end
end
