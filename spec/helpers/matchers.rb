module Bacon
  module Matchers

    ##
    #
    def be_a( klass )
      lambda { |obj| obj.is_a?( klass ) }
    end
    alias :be_an :be_a
  end
end

Bacon::Context.send :include, Bacon::Matchers
