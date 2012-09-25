require 'spec_helper'

describe Lotion::Services do
  let( :klass ){ Class.new do
    include Lotion::Services
  end }

  describe 'services' do
    subject { klass.new }

    its( :services ){ should be_a( Lotion::ServiceMap ) }

    it 'should instance eval the service map if given a block' do
      subject.services.should_receive( :map ).with( :foo => 'bar' )

      subject.services { map :foo => 'bar' }
    end
  end
end
