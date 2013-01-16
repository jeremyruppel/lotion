# require core_ext/ui_kit/ui_table_view_data_source
# require core_ext/ui_kit/ui_table_view_cell_style
# require core_ext/ui_kit/ui_table_view_delegate
# require core_ext/ui_kit/ui_text_field_delegate

module Lotion
  class Form
    include Lotion::Actor
    include Lotion::UITableViewDataSource

    # TODO these concerns feel like they might belong elsewhere
    include Lotion::UITableViewDelegate
    include Lotion::UITextFieldDelegate

    ##
    # The table data for this form.
    def data
      @data ||= self.class.sections
    end

    ##
    # The inputs associated with this form by name.
    def inputs
      @inputs ||= Hash.new { |h, k| h[ k ] = send( k ) }
    end

    def tableView( tableView, cellForRowAtIndexPath:indexPath )

      cell = tableView.dequeueReusableCellWithIdentifier( reuseIdentifier ) || begin
        UITableViewCell.alloc.initWithStyle \
          UITableViewCellStyle[ :default ], reuseIdentifier:reuseIdentifier
      end

      # TODO in desperate need of refactor
      case view = inputs[ data[ indexPath ] ]
      when UITextField
        cell.accessoryView           = view
        cell.selectionStyle          = UITableViewCellSelectionStyleNone
        view.delegate                = self
      when UIButton
        cell.textLabel.text          = view.currentTitle
        cell.textLabel.textAlignment = NSTextAlignmentCenter
        cell.userInteractionEnabled  = view.enabled?
      end

      cell
    end

    # TODO not sure this should be here
    # TODO [naming]
    def submit
      concern = self.class.to_s.underscore
      notify "#{concern}:submit", to_hash
    end

    # TODO [naming]
    def to_hash
      concern = self.class.to_s.underscore

      hsh = { }
      hsh[ concern ] = inputs.reduce( { } ) do |hsh, (key, input)|
        return hsh unless input.is_a?( UITextField )

        hsh[ key ] = input.text
        hsh
      end
      hsh
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
