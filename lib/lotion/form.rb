# require core_ext/ui_kit/ui_table_view_data_source
# require core_ext/ui_kit/ui_table_view_cell_style

module Lotion
  class Form
    include Lotion::UITableViewDataSource

    def data
      self.class.sections
    end

    # def tableView( tableView, cellForRowAtIndexPath:indexPath )
    #   cell = UITableViewCell.alloc.initWithStyle \
    #     UITableViewCellStyle[ :default ], reuseIdentifier:reuseIdentifier
    #
    #   cell.accessoryView = data[ indexPath ]
    #
    #   # cell.accessoryView.delegate = self
    #   # cell.accessoryView.release # TODO is this necessary?
    #   # cell.selectionStyle = UITableViewCellSelectionStyleNone
    #   cell
    # end

    class << self

      def sections
        @sections ||= Lotion::NamedArray.new( to_s.underscore )
      end

      def section( name )
        sections << Lotion::NamedArray.new( name )
      end

      def method_added( name )
        sections.last << name
      end
    end
  end
end
