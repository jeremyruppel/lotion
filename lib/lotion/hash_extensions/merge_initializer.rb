module Lotion
  module HashExtensions
    module MergeInitializer

      ##
      # Allows a hash to be initialized with the contents
      # of another hash.
      def initialize( hsh={}, default=nil, &block )
        default.nil? ? super( &block ) : super( default )
        merge! hsh
      end
    end
  end
end
