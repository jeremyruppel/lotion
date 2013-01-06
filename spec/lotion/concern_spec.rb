describe 'Lotion::Concern' do

  module MyConcern
    extend Lotion::Concern

    included do
      $ran << 'one'
    end
    included do
      $ran << 'two'
    end
    included do
      $who = self
    end

    def foo; true; end

    module ClassMethods
      def bar; true; end
    end
  end

  before do
    $ran   = [ ]
    @klass = Class.new do
      include MyConcern
    end
  end

  it 'responds to #foo' do
    @klass.new.should.respond_to :foo
  end
  it 'responds to .bar' do
    @klass.should.respond_to :bar
  end
  it 'runs all .included blocks' do
    $ran.should == [ 'one', 'two' ]
  end
  it 'runs the .included blocks in the context of the class' do
    $who.should == @klass
  end
end
