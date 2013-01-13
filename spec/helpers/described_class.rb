module Bacon
  module DescribedClass

    ##
    # Attempts to get the class under test from the context name.
    # TODO find a way to get the name of the root context so this
    # can be used in sub-contexts.
    def described_class
      name.constantize
    rescue NameError => e
      nil
    end
  end
end

Bacon::Context.send :include, Bacon::DescribedClass
