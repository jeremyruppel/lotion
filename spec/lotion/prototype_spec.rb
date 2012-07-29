require 'spec_helper'

describe Lotion::Prototype do

  let( :klass ){ Class.new do
    include Lotion::Prototype

    @@breakfasts = %w| eggs bacon oranges |
    prototype :breakfasts
  end }

  describe 'a new instance' do
    subject { klass.new }

    it 'should have the breakfasts instance variable set' do
      subject.instance_variable_defined?( :@breakfasts ).should be_true
    end
  end

  describe 'the prototyped property' do
    let( :instance ){ klass.new }
    let( :ivar     ){ instance.instance_variable_get( :@breakfasts ) }
    let( :cvar     ){ klass.class_variable_get( :@@breakfasts ) }

    it 'should equal the instance property' do
      cvar.should eq( ivar )
    end
    it 'should not be the instance property' do
      cvar.should_not be( ivar )
    end
    it 'should be frozen' do
      ivar.should be_frozen
    end
  end
end
