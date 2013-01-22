# require core_ext/ui_kit/ui_table_view_data_source
# require core_ext/ui_kit/ui_table_view_cell_style
# require inputs/ui_button_input
# require inputs/ui_text_field_input

module Lotion
  class Form
    include Lotion::Actor
    include Lotion::UITableViewDataSource

    abstract!

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
      case view = inputs[ data[ indexPath ] ].view
      when UITextField
        cell.accessoryView           = view
        cell.selectionStyle          = UITableViewCellSelectionStyleNone
        view.delegate                = tableView.delegate
      when UIButton
        cell.textLabel.text          = view.currentTitle
        cell.textLabel.textAlignment = NSTextAlignmentCenter
        cell.userInteractionEnabled  = view.enabled?
      end

      cell
    end

    # TODO [naming]
    def to_hash
      hsh = { }
      hsh[ concern ] = inputs.reduce( { } ) do |hsh, (key, input)|
        hsh[ key ] = input.value
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
