require 'spec_helper'

describe Lotion::Callbacks do
  let( :klass ){ Class.new do
    include Lotion::Callbacks
  end }

  before do
    $woot = nil
  end

  describe 'instance-level' do
    subject { klass.new }

    before do
      subject.on :foo do |arg|
        $woot = "foo: #{arg}"
      end
    end

    it 'should call the associated callback blocks' do
      subject.trigger :foo, 'bar'
      $woot.should eq 'foo: bar'
    end
  end
end
