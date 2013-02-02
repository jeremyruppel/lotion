describe Lotion::UIViewTraits do
  subject do
    include Lotion::UIViewTraits
  end

  before { subject.stub! :view, :return => double( 'view' ) }

  it 'delegates #tag to the view' do
    subject.should delegate [ :tag, :foo ] => [ :setTag, :foo ]
  end
  it 'delegates #frame to the view' do
    subject.should delegate [ :frame, :foo ] => [ :setFrame, :foo ]
  end
end
