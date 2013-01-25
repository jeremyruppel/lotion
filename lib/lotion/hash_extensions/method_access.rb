module Lotion
  module HashExtensions
    module MethodAccess

      ##
      # Allows access to symbol keys via methods of the
      # same name. If you want method access to string
      # keys, include `IndifferentAccess` as well.
      def method_missing( method, *args, &block )
        has_key?( method ) ? self[ method ] : super
      end
    end
  end
end
