require 'spec_helper'

describe Lotion::Container do
  subject { Class.new do
    include Lotion::Container
  end.new }

  it { should respond_to( :injector ) }
  it { should respond_to( :commands ) }
  it { should respond_to( :startup! ) }
end
