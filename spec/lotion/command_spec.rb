require 'spec_helper'

describe Lotion::Command do

  it { should respond_to( :call ) }

  it 'should expect subclasses to implement #call' do
    expect { subject.call }.to raise_error( NotImplementedError )
  end
end
