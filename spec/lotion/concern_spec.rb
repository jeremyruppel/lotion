require 'spec_helper'

describe Lotion::Concern do
  let( :concern ){ Module.new do
    extend Lotion::Concern

    def foo; 'foo!'; end

    module ClassMethods
      def bar; 'bar!'; end
    end
  end }

  let( :klass ){ Class.new }

  before { klass.send :include, concern }

  describe 'instance methods' do
    subject { klass.new }
    it { should respond_to( :foo ) }
    its( :foo ){ should eq( 'foo!' ) }
  end

  describe 'class methods' do
    subject { klass }
    it { should respond_to( :bar ) }
    its( :bar ){ should eq( 'bar!' ) }
  end
end
