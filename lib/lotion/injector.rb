module Lotion

  ##
  # Base class for all injection mappings
  #
  # @see ClassMapping
  # @see BlockMapping
  # @see ObjectMapping
  class InjectionMapping < Struct.new( :value )
  end

  ##
  # Handles the injection mapping of a class
  class ClassMapping < InjectionMapping
    def new
      value.new
    end
    def get
      @singleton ||= new
    end
  end

  ##
  # Handles the injection mapping of a block
  class BlockMapping < InjectionMapping
    def new
      value.call
    end
    def get
      @singleton ||= new
    end
  end

  ##
  # Handles the injection mapping of any other object
  class ObjectMapping < InjectionMapping
    def new
      value.class.new
    end
    def get
      @singleton ||= value
    end
  end

  ##
  #
  class Injector

    class << self

      ##
      #
      def map( *args )
        args.each do |mapping|
          case mapping
          when Class
            _map mapping, mapping
          when Hash
            mapping.each do |key, value|
              _map key, value
            end
          when Object
            _map mapping.class, mapping
          end
        end
      end

      # TODO test that injector inheritance is working as expected
      def mappings # :nodoc:
        @mappings ||= Hash.new
      end

      protected

      def _map( key, value ) # :nodoc:
        case value
        when Class
          mappings[ key ] = ClassMapping.new value
        when Proc
          mappings[ key ] = BlockMapping.new value
        when Object
          mappings[ key ] = ObjectMapping.new value
        end
      end
    end

    def initialize # :nodoc:
      @mappings = self.class.mappings.dup.freeze
    end

    ##
    #
    def get( mapping, options={} )
      case value = @mappings[ mapping ]
      when NilClass
        raise 'ZOMG NEED TO TEST THIS EXCEPTION'
      when InjectionMapping
        options[ :new ] ? value.new : value.get
      end
    end
  end
end
