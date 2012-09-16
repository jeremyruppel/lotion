require 'spec_helper'

describe Module do
  it { should respond_to( :delegate ) }

  describe 'delegation' do
    let( :receiver ){ double 'receiver', :foo => 'bar' }

    let( :delegate ){ Struct.new( :receiver ) do
      delegate :foo, :to => :receiver
    end }

    subject { delegate.new receiver }

    it { should respond_to( :foo ) }

    it 'should delegate the message to its receiver' do
      receiver.should_receive( :foo ).once
      subject.foo
    end
  end
end
