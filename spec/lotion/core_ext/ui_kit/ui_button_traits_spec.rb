describe Lotion::UIButtonTraits do
  subject do
    include Lotion::UIButtonTraits
  end

  before { subject.stub! :view, :return => double( 'view' ) }

  it 'delegates #title to the view' do
    subject.should delegate [ :title, :foo ] => [ :'setTitle:forState', :foo, UIControlStateNormal ]
  end
  it 'delegates #title_color to the view' do
    subject.should delegate [ :title_color, :foo ] => [ :'setTitleColor:forState', :foo, UIControlStateNormal ]
  end
  it 'delegates #image to the view' do
    subject.should delegate [ :image, :foo ] => [ :'setImage:forState', :foo, UIControlStateNormal ]
  end
end
