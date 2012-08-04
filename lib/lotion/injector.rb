# require injectable

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

    ##
    #
    def get( mapping, options={} )
      case value = mappings[ mapping ]
      when NilClass
        raise InjectionError, %Q{No injection mapping found for "#{mapping}"}
      when InjectionMapping
        options[ :new ] ? value.new : value.get
      end
    end

    ##
    #
    def inject_into( object )
      if object.is_a?( Injectable )
        object.fill_injection_points self
      else
        raise InjectionError, 'Cannot inject into objects that do not include Lotion::Injectable'
      end
    end

    private

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

    def mappings
      @mappings ||= Hash.new
    end
  end
end
