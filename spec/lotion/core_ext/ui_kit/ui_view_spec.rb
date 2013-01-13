describe UIView do

  describe '.configure' do
    before do
      @view = UIView.alloc
      UIView.mock! :alloc, :return => @view
    end

    it 'returns the allocated view' do
      UIView.configure { }.should == @view
    end
    it 'executes the block' do
      $called = false
      UIView.configure { $called = true }
      $called.should == true
    end
    it 'executes the block in the context of the view proxy' do
      $caller = nil
      UIView.configure { $caller = self }
      $caller.is_a?( UIView.proxy ).should == true
      $caller.view.should == @view
    end
    it 'calls #initWithFrame if the :frame option is given' do
      @view.mock! :initWithFrame do |arg|
        arg.should == :foo
      end
      UIView.configure( :frame => :foo ){ }
    end
    it 'calls #initWithCoder if the :coder option is given' do
      @view.mock! :initWithCoder do |arg|
        arg.should == :foo
      end
      UIView.configure( :coder => :foo ){ }
    end
  end

  describe '.proxy' do

    it 'returns a class' do
      UIView.proxy.is_a?( Class ).should == true
    end
    it 'executes the block' do
      $called = false
      UIView.proxy { $called = true }
      $called.should == true
    end
    it 'executes the block in the context of the proxy class' do
      $caller = nil
      UIView.proxy { $caller = self }
      $caller.should == UIView.proxy
    end
  end
end
