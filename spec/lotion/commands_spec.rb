require 'spec_helper'

describe Lotion::Commands do
  let( :callbacks ){ Class.new do
    include Lotion::Callbacks
  end.new }

  let( :injector  ){ double 'injector', :inject_into => true }
  let( :command   ){ double 'command' }

  subject { described_class.new callbacks, injector }

  it { should respond_to( :map ) }

  describe 'mapping a command to an event' do
    before { subject.map :event, command }

    it 'should instantiate and execute the command when the event is triggered' do
      instance = double 'command instance', :execute => true
      command.should_receive( :new ).and_return instance
      instance.should_receive( :execute )

      callbacks.trigger :event
    end
  end
end
