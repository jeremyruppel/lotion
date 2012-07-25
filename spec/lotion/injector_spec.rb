require 'spec_helper'

describe Lotion::Injector do

  describe 'map' do
    class Foo; end
    class Bar; end

    let( :injector ){ Class.new(described_class) }

    describe 'implied class' do
      before  { injector.map Foo }
      subject { injector.new }

      it 'should instantiate the mapped class' do
        subject.get( Foo ).should be_a( Foo )
      end
      it 'should hand back the same instance by default' do
        subject.get( Foo ).should be( subject.get( Foo ) )
      end
      it 'should instantiate a new instance if requested' do
        subject.get( Foo, :new => true ).should be_a( Foo )
        subject.get( Foo, :new => true ).should_not be( subject.get( Foo ) )
      end
    end

    describe 'class keyed by class' do
      before  { injector.map Foo => Foo }
      subject { injector.new }

      it 'should instantiate the mapped class' do
        subject.get( Foo ).should be_a( Foo )
      end
      it 'should hand back the same instance by default' do
        subject.get( Foo ).should be( subject.get( Foo ) )
      end
      it 'should instantiate a new instance if requested' do
        subject.get( Foo, :new => true ).should be_a( Foo )
        subject.get( Foo, :new => true ).should_not be( subject.get( Foo ) )
      end
    end

    describe 'class keyed by symbol' do
      before  { injector.map :foo_name => Foo }
      subject { injector.new }

      it 'should instantiate the mapped class' do
        subject.get( :foo_name ).should be_a( Foo )
      end
      it 'should hand back the same instance by default' do
        subject.get( :foo_name ).should be( subject.get( :foo_name ) )
      end
      it 'should instantiate a new instance if requested' do
        subject.get( :foo_name, :new => true ).should be_a( Foo )
        subject.get( :foo_name, :new => true ).should_not be( subject.get( :foo_name ) )
      end
    end

    describe 'implied instance' do
      let( :instance ){ Foo.new }

      before  { injector.map instance }
      subject { injector.new }

      it 'should hand back the mapped instance' do
        subject.get( Foo ).should be( instance )
      end
      it 'should hand back the same instance by default' do
        subject.get( Foo ).should be( subject.get( Foo ) )
      end
      it 'should instantiate a new instance if requested' do
        subject.get( Foo, :new => true ).should be_a( Foo )
        subject.get( Foo, :new => true ).should_not be( instance )
      end
    end

    describe 'instance keyed by class' do
      let( :instance ){ Foo.new }

      before  { injector.map Foo => instance }
      subject { injector.new }

      it 'should hand back the mapped instance' do
        subject.get( Foo ).should be( instance )
      end
      it 'should hand back the same instance by default' do
        subject.get( Foo ).should be( subject.get( Foo ) )
      end
      it 'should instantiate a new instance if requested' do
        subject.get( Foo, :new => true ).should be_a( Foo )
        subject.get( Foo, :new => true ).should_not be( instance )
      end
    end

    describe 'instance keyed by symbol' do
      let( :instance ){ Foo.new }

      before  { injector.map :foo_name => instance }
      subject { injector.new }

      it 'should hand back the mapped instance' do
        subject.get( :foo_name ).should be( instance )
      end
      it 'should hand back the same instance by default' do
        subject.get( :foo_name ).should be( subject.get( :foo_name ) )
      end
      it 'should instantiate a new instance if requested' do
        subject.get( :foo_name, :new => true ).should be_a( Foo )
        subject.get( :foo_name, :new => true ).should_not be( instance )
      end
    end

    describe 'block keyed by class' do
      before  { injector.map Foo => lambda { Foo.new } }
      subject { injector.new }

      it 'should hand back the result of the block' do
        subject.get( Foo ).should be_a( Foo )
      end
      it 'should hand back the same result by default' do
        subject.get( Foo ).should be( subject.get( Foo ) )
      end
      it 'should run the block again if requested' do
        subject.get( Foo, :new => true ).should be_a( Foo )
        subject.get( Foo, :new => true ).should_not be( subject.get( Foo ) )
      end
    end

    describe 'block keyed by symbol' do
      before  { injector.map :foo_name => lambda { Foo.new } }
      subject { injector.new }

      it 'should hand back the result of the block' do
        subject.get( :foo_name ).should be_a( Foo )
      end
      it 'should hand back the same result by default' do
        subject.get( :foo_name ).should be( subject.get( :foo_name ) )
      end
      it 'should run the block again if requested' do
        subject.get( :foo_name, :new => true ).should be_a( Foo )
        subject.get( :foo_name, :new => true ).should_not be( subject.get( :foo_name ) )
      end
    end

    describe 'multiple' do
      before  { injector.map Foo, :bar => Bar }
      subject { injector.new }

      it 'should map foo' do
        subject.get( Foo ).should be_a( Foo )
      end
      it 'should map bar' do
        subject.get( :bar ).should be_a( Bar )
      end
    end
  end
end
