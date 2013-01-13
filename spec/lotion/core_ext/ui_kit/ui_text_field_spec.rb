describe UITextField do

  describe '.proxy' do

    before do
      @proxy = UITextField.proxy.new( UITextField.alloc )
    end

    it 'includes UITextInputTraits' do
      @proxy.is_a?( Lotion::UITextInputTraits ).should == true
    end
    it 'delegates #placeholder to the view' do
      @proxy.view.mock! :setPlaceholder do |arg|
        arg.should == :foo
      end
      @proxy.placeholder :foo
    end
    it 'delegates #clear_button_mode to the view' do
      @proxy.view.mock! :setClearButtonMode do |arg|
        arg.should == :foo
      end
      @proxy.clear_button_mode :foo
    end
  end
end
