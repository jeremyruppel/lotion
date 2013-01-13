module Lotion
  module Form
    module Delegate

      def numberOfSectionsInTableView( tableView )
        data.size
      end

      def tableView( tableView, titleForHeaderInSection:section )
        data[ section ].title
      end

      def tableView( tableView, numberOfRowsInSection:section )
        data[ section ].size
      end

      def tableView( tableView, cellForRowAtIndexPath:indexPath )
        cell = UITableViewCell.alloc.initWithStyle \
          UITableViewCellStyleDefault, reuseIdentifier:reuseIdentifier

        cell.accessoryView = data[ indexPath ]

        cell.accessoryView.delegate = self
        cell.accessoryView.release # TODO is this necessary?
        cell.selectionStyle = UITableViewCellSelectionStyleNone
        cell
      end

      def reuseIdentifier
        "#{self.class.to_s.underscore}::#{hash}"
      end
    end
  end
end
