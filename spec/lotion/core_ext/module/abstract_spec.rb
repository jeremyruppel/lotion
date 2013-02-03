describe 'Module' do
  it 'is not #abstract?' do
    Module.abstract?.should == nil
  end
  it 'does not have an #abstract_type' do
    Module.abstract_type.should == nil
  end
end

describe 'an abstract class' do
  class Lotion::FooBar
    abstract!
  end
  it 'is #abstract?' do
    Lotion::FooBar.abstract?.should.not == nil
  end
  it 'has an #abstract_type' do
    Lotion::FooBar.abstract_type.should == 'FooBar'
  end
end

describe Lotion::Command do
  it 'is #abstract?' do
    Lotion::Command.abstract?.should.not == nil
  end
  it 'has an #abstract_type' do
    Lotion::Command.abstract_type.should == 'Command'
  end
end

describe Lotion::Form do
  it 'is #abstract?' do
    Lotion::Form.abstract?.should.not == nil
  end
  it 'has an #abstract_type' do
    Lotion::Form.abstract_type.should == 'Form'
  end
end

describe Lotion::Input do
  it 'is #abstract?' do
    Lotion::Input.abstract?.should.not == nil
  end
  it 'has an #abstract_type' do
    Lotion::Input.abstract_type.should == 'Input'
  end
end

describe Lotion::UIFormViewController do
  it 'is #abstract?' do
    Lotion::UIFormViewController.abstract?.should.not == nil
  end
  it 'has an #abstract_type' do
    Lotion::UIFormViewController.abstract_type.should == 'ViewController'
  end
end
