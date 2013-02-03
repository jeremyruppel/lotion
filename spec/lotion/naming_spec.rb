describe Lotion::Naming do

  describe 'a well-named class' do
    class FooBarForm < Lotion::Form
    end

    before do
      @subject = FooBarForm.new
    end

    it 'identifies its #class_name' do
      @subject.class_name.should == 'FooBarForm'
    end
    it 'identifies its #class_type' do
      @subject.class_type.should == 'Form'
    end
    it 'identifies its #concern' do
      @subject.concern.should == 'foo_bar'
    end
  end

  describe 'a poorly-named class' do
    class FooBar < Lotion::Form
    end

    before do
      @subject = FooBar.new
    end

    it 'identifies its #class_name' do
      @subject.class_name.should == 'FooBar'
    end
    it 'returns nil for #class_type' do
      @subject.class_type.should == 'Form'
    end
    it 'raises an error on #concern' do
      lambda { @subject.concern }.should.raise( Lotion::NamingError )
    end
  end
end
