require 'spec_helper'

describe Lotion::Application do
  subject { Class.new do
    include Lotion::Application
  end.new }

  it { should respond_to( :application ) }

  let( :application ){ double 'application' }
  let( :options ){ double 'launch options' }

  it 'should return true, of course' do
    subject.application( application, options ).should == true
  end
end
