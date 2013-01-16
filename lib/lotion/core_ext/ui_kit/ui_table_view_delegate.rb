module Lotion
  module UITableViewDelegate

    # TODO this is app-specific. generalize.
    def tableView( tableView, didSelectRowAtIndexPath:indexPath )
      case view = inputs[ data[ indexPath ] ]
      when UIButton
        submit
      end
    end
  end
end