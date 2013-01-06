describe 'Lotion::Concern' do

  module MyConcern
    extend Lotion::Concern

    included do
      $ran << 'one'
    end
    included do
      $ran << 'two'
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
end
