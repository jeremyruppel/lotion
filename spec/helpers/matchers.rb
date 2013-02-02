module Bacon
  module Matchers

    ##
    #
    def be_a( klass )
      lambda { |obj| obj.is_a?( klass ) }
    end
    alias :be_an :be_a

    ##
    #
    def delegate( methods={} )
      lambda { |subject|
        methods.each do |((orig_method, *orig_args), (new_method, *new_args))|
          subject.view.mock! orig_method do |*args|
            args.should == orig_args
          end
          subject.send new_method, *new_args
        end
      }
    end
  end
end

Bacon::Context.send :include, Bacon::Matchers
