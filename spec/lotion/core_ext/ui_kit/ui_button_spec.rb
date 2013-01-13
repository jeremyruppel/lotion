describe UIButton do

  describe '.proxy' do

    before do
      @proxy = UIButton.proxy.new double( 'view' )
    end

    it 'delegates #title to the view' do
      @proxy.view.mock! 'setTitle:forState:' do |title, state|
        title.should == 'Foo'
        state.should == UIControlStateNormal
      end
      @proxy.title 'Foo', :normal
    end
    it 'delegates #title_color to the view' do
      @proxy.view.mock! 'setTitleColor:forState:' do |color, state|
        color.should == :foo
        state.should == UIControlStateNormal
      end
      @proxy.title_color :foo, :normal
    end
  end
end
