# require core_ext/ui_kit/ui_table_view_data_source
# require core_ext/ui_kit/ui_table_view_cell_style
# require inputs/ui_button_input
# require inputs/ui_text_field_input
# require validations

module Lotion
  class Form
    include Lotion::Actor
    include Lotion::UITableViewDataSource
    include Lotion::Validations

    abstract!

    attr_accessor :delegate

    delegate :navigationController, :to => :delegate

    # TODO not in love with this pattern. is there something more elegant?
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
      # TODO calling the delegate methods feels more like a side effect.
      # Look for a way to make this not the primary behavior.
      if submitted = valid?
        try( :delegate ).try :formDidSubmit, self
      else
        try( :delegate ).try :'formDidFailValidation:withErrors', self, errors
      end
      submitted
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
        cell.imageView = view
        # cell.backgroundView          = view
        cell.selectionStyle          = UITableViewCellSelectionStyleNone
      end

      cell
    end

    ##
    # A hash representation of this form.
    def to_hash
      { concern => Hash[ inputs.map { |k, v| [ k, v.value ] } ].compact }
    end

    class << self

      ##
      # The sections for this form. Not part of the public API.
      def sections
        @sections ||= Lotion::NamedArray.new( to_s.underscore )
      end

      ##
      # Adds a section to this form, optionally with a name.
      def section( name=nil )
        sections << Lotion::NamedArray.new( name )
      end

      ##
      # Catches any methods defined on this form and adds them
      # as inputs to the last section declared.
      def method_added( name )
        # TODO consider making this only add public methods as inputs?
        sections.last << name
      end
    end
  end
end
