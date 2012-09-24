require 'spec_helper'

describe Lotion::Callbacks do
  let( :klass ){ Class.new do
    include Lotion::Callbacks
  end }

  describe 'methods' do
    subject { klass.new }
    it { should respond_to( :on ) }
    it { should respond_to( :trigger ) }
  end

  describe 'one callback' do
    let( :proc ){ Proc.new { } }
    let( :args ){ [ 1, 2, 3 ] }

    subject { klass.new }
    before  { subject.on :event, &proc }
    after   { subject.trigger :event, *args }

    it 'should call the proc' do
      proc.should_receive( :call ).with( *args )
    end
  end
end
