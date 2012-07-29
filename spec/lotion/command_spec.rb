require 'spec_helper'

describe Lotion::Command do

  it { should respond_to( :execute ) }

  it 'should expect subclasses to implement #execute' do
    expect { subject.execute }.to raise_error( NotImplementedError )
  end
end
