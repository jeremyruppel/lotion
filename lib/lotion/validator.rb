module Lotion
  class Validator

    ##
    #
    def initialize( options={} )
      @options = case options
      when TrueClass
        { }
        # TODO probably want to set defaults here, like:
        # { :allow_nil => false }
      when Hash
        options
      else
        # TODO probably want to raise an exception here
      end
    end
    attr_accessor :options

    ##
    #
    def validate( value, attribute, errors )
      raise NotImplementedError
    end
  end
end
