require 'spec_helper'

describe Lotion::Commands do
  let( :klass ){ Class.new do
    include Lotion::Commands
  end }

  describe 'commands' do
    subject { klass.new }

    its( :commands ){ should be_a( Lotion::CommandMap ) }

    it 'should instance eval the command map if given a block' do
      subject.commands.should_receive( :map ).with( :foo => 'bar' )

      subject.commands { map :foo => 'bar' }
    end
  end
end
