# require core_ext/ui_kit/ui_table_view_delegate
# require core_ext/ui_kit/ui_text_field_delegate

module Lotion
  module UIFormViewController
    extend Lotion::Concern
    # FXME this isn't working because our concern implementation
    # does not handle its own dependencies, namely class methods.
    # include Lotion::Actor
    include Lotion::UITableViewDelegate
    include Lotion::UITextFieldDelegate

    abstract! 'ViewController'

    included do
      delegate :data, :inputs, :to => :form
    end

    def init
      super && initWithStyle( UITableViewStyleGrouped )
    end

    # ________ UIFormViewDelegate ________ #

    def navigationController
      super
    end

    # FIXME instead of delegate methods, could we use our
    # own notification center? IOC, son!
    def formDidSubmit( form )
      puts "FORM DID SUBMIT"
      notify "#{concern}:submit", form.to_hash
    end

    module ClassMethods

      def form( form_class )
        define_method :form do
          @form ||= form_class.alloc.initWithDelegate( self )
        end
      end
    end
  end
end
