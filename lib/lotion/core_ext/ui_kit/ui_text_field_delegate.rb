module Lotion
  module UITextFieldDelegate

    # TODO this is app-specific. generalize.
    def textFieldShouldReturn( textField )
      case textField.returnKeyType
      when UIReturnKeyType[ :next ]
        if nextField = inputs[ data.rows[ textField.tag.next ] ].view
          nextField.becomeFirstResponder
        else
          textField.resignFirstResponder
        end
      when UIReturnKeyType[ :go ]
        textField.resignFirstResponder
        form.submit!
      else
        false
      end
    end
  end
end
