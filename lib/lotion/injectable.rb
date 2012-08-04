module Lotion
  module Injectable
    extend Lotion::Concern

    def initialize # :nodoc:
      # TODO refactor into a class-level utility method
      @injection_points = self.class.injection_points.dup.freeze
      super
    end

    ##
    #
    def fill_injection_points( injector )
      @injection_points.each_pair do |key, value|
        instance_variable_set :"@#{key}", injector.get( value )
      end
    end

    module ClassMethods

      ##
      #
      def inject( hash )
        hash.each_pair do |key, value|
          attr_reader key
          injection_points[ key ] = value
        end
      end

      ##
      #
      def injection_points
        @injection_points ||= { }
      end
    end
  end
end
