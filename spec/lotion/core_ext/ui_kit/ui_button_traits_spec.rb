describe Lotion::UIButtonTraits do
  subject do
    include Lotion::UIButtonTraits
  end

  before { subject.stub! :view, :return => double( 'view' ) }

  it 'delegates #title to the view' do
    subject.should delegate [ :'setTitle:forState', :foo, UIControlStateNormal ] => [ :title, :foo ]
  end
  it 'delegates #title_color to the view' do
    subject.should delegate [ :'setTitleColor:forState', :foo, UIControlStateNormal ] => [ :title_color, :foo ]
  end
  it 'delegates #image to the view' do
    subject.should delegate [ :'setImage:forState', :foo, UIControlStateNormal ] => [ :image, :foo ]
  end
end
