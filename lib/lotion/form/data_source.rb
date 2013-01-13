module Lotion
  module Form
    module DataSource

      ##
      # The top-level data structure for table data.
      class IndexPathArray < Array

        ##
        # Override array access to let NSIndexPath access a
        # multidimensional array easily.
        def []( index )
          index.is_a?( NSIndexPath ) ? self[ index.section ][ index.row ] : super
        end
      end

      ##
      #
      class TableSection < Array

        ##
        # The only required parameter for a section is the header title.
        # TODO refactor this to allow footer text.
        def initialize( title, &block )
          @title = title
          instance_eval &block
        end
        attr_reader :title

        def text_field( &block )
          self << block.call
        end
      end

      ##
      #
      def section( title=nil, &block )
        data << TableSection.new( title, &block )
      end

      ##
      # The table view data. There should be no need to access this directly.
      def data
        @data ||= IndexPathArray.new
      end
    end
  end
end
