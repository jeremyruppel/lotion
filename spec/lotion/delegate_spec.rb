require 'spec_helper'

describe Lotion::Delegate do
  subject { Module.new do
    extend Lotion::Delegate
  end }

  it { should respond_to( :delegate ) }

  describe 'delegation' do
    let( :member ){ double 'member', :foo => true }

    before { subject.instance_eval do
      # TODO write a mattr_accessor core extension
      def member
        @member
      end
      def member=( val )
        @member = val
      end
      delegate :foo, :to => :member
    end }

    it { should respond_to( :foo ) }

    before { subject.member = member }

    it 'should delegate the method to the given receiver' do
      member.should_receive( :foo ).once
      subject.foo
    end
  end
end
