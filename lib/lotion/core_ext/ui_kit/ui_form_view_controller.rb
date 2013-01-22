# require core_ext/ui_kit/ui_table_view_delegate
# require core_ext/ui_kit/ui_text_field_delegate

module Lotion
  module UIFormViewController
    extend Lotion::Concern
    include Lotion::Actor
    include Lotion::UITableViewDelegate
    include Lotion::UITextFieldDelegate

    abstract! 'ViewController'

    included do
      delegate :data, :inputs, :to => :form
    end

    def init
      super && initWithStyle( UITableViewStyleGrouped )
    end

    # TODO not sure this should be here
    # TODO [naming]
    def submit
      notify "#{concern}:submit", form.to_hash
    end

    module ClassMethods

      def form( form_class )
        define_method :form do
          @form ||= form_class.alloc
        end
      end
    end
  end
end
