require 'spec_helper'

describe Lotion::Container do
  subject { Class.new do
    include Lotion::Container
  end.new }

  it { should be_a( Lotion::Callbacks ) }
  it { should be_a( Lotion::Commands ) }
  it { should be_a( Lotion::Services ) }

  # TODO alias_method_chain #application for this
  it { should respond_to( :startup! ) }
end
