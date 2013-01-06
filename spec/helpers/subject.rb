module Bacon
  module Subject

    ##
    # Syntactic sugar for creating an anonymous class in a before block.
    def subject( &block )
      block_given? ? before { @subject = Class.new( &block ).new } : @subject
    end
  end
end

Bacon::Context.send :include, Bacon::Subject
