module Lotion
  module UITextFieldDelegate

    # TODO this is app-specific. generalize.
    def textFieldShouldReturn( textField )
      case textField.returnKeyType
      when UIReturnKeyType[ :next ]
        if nextField = inputs[ data.rows[ textField.tag.next ] ]
          nextField.becomeFirstResponder
        else
          textField.resignFirstResponder
        end
      when UIReturnKeyType[ :go ]
        textField.resignFirstResponder
        submit
      else
        false
      end
    end
  end
end
