describe Lotion::Concern do

  module MyConcern
    extend Lotion::Concern

    included { $ran << 'one' }
    included { $ran << 'two' }
    included { $who = self   }

    def foo; true; end

    module ClassMethods; def bar; true; end; end
  end

  before { $ran = [ ] }

  subject do
    include MyConcern
  end

  it 'responds to #foo' do
    subject.should.respond_to :foo
  end
  it 'responds to .bar' do
    subject.class.should.respond_to :bar
  end
  it 'runs all .included blocks' do
    $ran.should == [ 'one', 'two' ]
  end
  it 'runs the .included blocks in the context of the class' do
    $who.should == subject.class
  end
end
