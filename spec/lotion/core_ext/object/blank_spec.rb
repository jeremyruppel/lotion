describe 'Object#blank?' do
  it 'is not #blank?' do
    Object.new.blank?.should == false
  end
end
describe 'Nil#blank?' do
  it 'is always #blank?' do
    nil.blank?.should == true
  end
end
describe 'Array#blank?' do
  it 'is #blank? if it is empty' do
    [ ].blank?.should == true
  end
  it 'is not #blank? if it is not empty' do
    [ :foo ].blank?.should == false
  end
end
describe 'Hash#blank?' do
  it 'is #blank? if it is empty' do
    { }.blank?.should == true
  end
  it 'is not #blank? if it is not empty' do
    { :foo => :bar }.blank?.should == false
  end
end
describe 'String#blank?' do
  it 'is #blank? if it is an empty string' do
    ''.blank?.should == true
  end
  it 'is #blank? if it contains only whitespace' do
    '   '.blank?.should == true
  end
  it 'is not #blank? if it contains other characters' do
    'a'.blank?.should == false
  end
end
