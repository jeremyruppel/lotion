module Lotion
  class NamedArray < Array

    ##
    # Accepts the name of this array in the constructor.
    def initialize( name )
      # TODO do some #caller magic here?
      @name = name
    end
    attr_reader :name

    ##
    # Override array access to let NSIndexPath access a
    # multidimensional array easily.
    def []( index )
      index.is_a?( NSIndexPath ) ? self[ index.section ][ index.row ] : super
    end

    ##
    # Since NamedArray assumes it is multidimensional,
    # this is a convenience accessor for the second dimension
    # of items.
    def rows
      flatten
    end
  end

  module UITableViewDataSource

    ##
    # The data for this table, expected to be a two-dimensional NamedArray.
    def data
      @data ||= Lotion::NamedArray.new( self.class.to_s.underscore )
    end

    ##
    # A reuseIdentifier unique to this data source.
    def reuseIdentifier
      "#{data.name}:#{hash}"
    end

    ##
    # The number of sections in the table view.
    def numberOfSectionsInTableView( tableView )
      data.count
    end

    ##
    # The title for the header in the given section.
    def tableView( tableView, titleForHeaderInSection:section )
      data[ section ].name
    end

    ##
    # The number of rows in the given section.
    def tableView( tableView, numberOfRowsInSection:section )
      data[ section ].count
    end
  end
end
