# require core_ext/ui_kit/ui_table_view_cell_style

module Lotion
  module FormViewController
    module Delegate

      # TODO these should all be moved into a table concern

      def numberOfSectionsInTableView( tableView )
        data.count
      end

      def tableView( tableView, titleForHeaderInSection:section )
        data[ section ].title
      end

      def tableView( tableView, numberOfRowsInSection:section )
        data[ section ].count
      end

      def tableView( tableView, cellForRowAtIndexPath:indexPath )
        cell = UITableViewCell.alloc.initWithStyle \
          UITableViewCellStyle[ :default ], reuseIdentifier:reuseIdentifier

        cell.accessoryView = data[ indexPath ]

        # cell.accessoryView.delegate = self
        # cell.accessoryView.release # TODO is this necessary?
        # cell.selectionStyle = UITableViewCellSelectionStyleNone
        cell
      end

      def reuseIdentifier
        "#{self.class.to_s.underscore}::#{hash}"
      end
    end
  end
end
