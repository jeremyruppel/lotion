describe Lotion::UIViewTraits do
  subject do
    include Lotion::UIViewTraits
  end

  before { subject.stub! :view, :return => double( 'view' ) }

  it 'delegates #tag to the view' do
    subject.should delegate [ :setTag, :foo ] => [ :tag, :foo ]
  end
  it 'delegates #frame to the view' do
    subject.should delegate [ :setFrame, :foo ] => [ :frame, :foo ]
  end
end
