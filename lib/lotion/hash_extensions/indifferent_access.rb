module Lotion
  module HashExtensions
    module IndifferentAccess

      def []( key )
        key.is_a?( String ) ? super( key.to_sym ) : super
      end

      def []=( key, value )
        key.is_a?( String ) ? super( key.to_sym, value ) : super
      end

      # %w| has_key? include? key? member? |.each do |method|
      #   define_method( method ) do |key|
      #     key.is_a?( String ) ? super( key.to_sym ) : super
      #   end
      # end
    end
  end
end
