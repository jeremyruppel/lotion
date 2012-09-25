require 'spec_helper'
require 'lotion/core_ext/extract_options'
require 'lotion/core_ext/delegate'

describe Module do
  it { should respond_to( :delegate ) }

  it { should be_a( Forwardable ) }
  it { should respond_to( :def_delegator ) }

  subject { Module.new }

  # def_delegator(accessor, method, ali = method)
  # def_delegators(accessor, *methods)

  it 'should call def_delegator for one method' do
    subject.should_receive( :def_delegator ).with( :receiver, :one, :one )

    subject.delegate :one, :to => :receiver
  end

  it 'should call def_delegator twice for two methods' do
    subject.should_receive( :def_delegator ).exactly( :twice )

    subject.delegate :one, :two, :to => :receiver
  end

  it 'should delegate with a default prefix' do
    subject.should_receive( :def_delegator ).with( :receiver, :one, :receiver_one )

    subject.delegate :one, :to => :receiver, :prefix => true
  end

  it 'should delegate with a custom prefix' do
    subject.should_receive( :def_delegator ).with( :receiver, :one, :custom_one )

    subject.delegate :one, :to => :receiver, :prefix => :custom
  end
end
