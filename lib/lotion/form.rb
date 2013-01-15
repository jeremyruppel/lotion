# require core_ext/ui_kit/ui_table_view_data_source
# require core_ext/ui_kit/ui_table_view_cell_style

module Lotion
  class Form
    include Lotion::Actor
    include Lotion::UITableViewDataSource

    def data
      @data ||= self.class.sections
    end

    def tableView( tableView, cellForRowAtIndexPath:indexPath )
      # puts "TABLE VIEW CELL: #{reuseIdentifier} #{data[ indexPath ]}"

      view = send( data[ indexPath ] )

      cell = tableView.dequeueReusableCellWithIdentifier( reuseIdentifier ) || begin
        UITableViewCell.alloc.initWithStyle \
          UITableViewCellStyle[ :default ], reuseIdentifier:reuseIdentifier
      end

      cell.accessoryView  = view
      cell.selectionStyle = UITableViewCellSelectionStyleNone

      view.delegate = self if view.respond_to? :delegate

      # cell.accessoryView.delegate = self
      # cell.accessoryView.release # TODO is this necessary?

      cell
    end

    def textFieldShouldReturn( textField )
      case textField.returnKeyType
      when UIReturnKeyType[ :next ]
        if nextField = send( data.rows[ textField.tag.next ] )
          nextField.becomeFirstResponder
        else
          textField.resignFirstResponder
        end
      when UIReturnKeyType[ :go ]
        textField.resignFirstResponder
        # TODO notify the context?
      else
        false
      end
    end

    class << self

      def sections
        @sections ||= Lotion::NamedArray.new( to_s.underscore )
      end

      def section( name=nil )
        sections << Lotion::NamedArray.new( name )
      end

      def method_added( name )
        sections.last << name
      end
    end
  end
end
