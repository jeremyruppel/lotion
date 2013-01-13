describe UITextField do

  describe '.proxy' do

    before do
      @proxy = UITextField.proxy.new double( 'view' )
    end

    it 'includes UIViewTraits' do
      @proxy.is_a?( Lotion::UIViewTraits ).should == true
    end
    it 'includes UITextInputTraits' do
      @proxy.is_a?( Lotion::UITextInputTraits ).should == true
    end
    it 'delegates #placeholder to the view' do
      @proxy.view.mock! :setPlaceholder do |arg|
        arg.should == 'Foo'
      end
      @proxy.placeholder 'Foo'
    end
    it 'delegates #clear_button_mode to the view' do
      @proxy.view.mock! :setClearButtonMode do |arg|
        arg.should == UITextFieldViewModeNever
      end
      @proxy.clear_button_mode :never
    end
  end
end
