# require core_ext/ui_kit/ui_table_view_data_source
# require core_ext/ui_kit/ui_table_view_cell_style
# require inputs/ui_button_input
# require inputs/ui_text_field_input

module Lotion
  class Form
    include Lotion::Actor
    include Lotion::UITableViewDataSource

    abstract!

    attr_accessor :delegate

    delegate :navigationController, :to => :delegate

    def initWithDelegate( delegate )
      self.delegate = delegate
      self
    end

    ##
    # The table data for this form.
    def data
      @data ||= self.class.sections
    end

    ##
    # The inputs associated with this form by name.
    def inputs
      @inputs ||= Hash.new do |h, k|
        h[ k ] = send( k ).tap { |i| i.form = self }
      end
    end

    ##
    # Clears all of the inputs in this form.
    def clear!
      inputs.each_value &:clear!
    end

    ##
    #
    def submit!
      # TODO this may be a good candidate for a #try method,
      # seems like that is the idiom ios delegates use.
      if delegate && delegate.respond_to?( :formDidSubmit )
        delegate.formDidSubmit self
      end
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
        cell.backgroundView          = view
        cell.selectionStyle          = UITableViewCellSelectionStyleNone
        cell.contentView.userInteractionEnabled = false
      when UIImageView
        cell.backgroundView          = view
        cell.selectionStyle          = UITableViewCellSelectionStyleNone
      end

      cell
    end

    def to_hash
      { concern => Hash[ inputs.map { |k, v| [ k, v.value ] } ].compact }
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
