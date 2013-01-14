describe Lotion::UIViewTraits do
  subject do
    include Lotion::UIViewTraits
  end

  before { subject.stub! :view, :return => double( 'view' ) }

  it 'delegates #tag to the view' do
    subject.view.mock! :setTag do |arg|
      arg.should == :foo
    end
    subject.tag :foo
  end
  it 'delegates #frame to the view' do
    subject.view.mock! :setFrame do |arg|
      arg.should == :foo
    end
    subject.frame :foo
  end
end
