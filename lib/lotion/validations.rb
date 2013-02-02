# require validators/presence_validator

module Lotion
  module Validations
    extend Lotion::Concern

    ##
    # Runs all validations on this object. Return false
    # if there were any errors, true if there were none.
    def valid?
      errors.clear

      self.class.validators.each do |attribute, list|
        value = send( attribute )

        list.each do |validator|
          validator.validate value, attribute, errors
        end
      end

      errors.empty?
    end

    ##
    # A hash containing validation errors on this object.
    def errors
      @errors ||= Hash.new { |h, k| h[ k ] = [ ] }
    end

    module ClassMethods

      ##
      # Adds new validations to the specified attribute.
      def validates( attribute, validations )
        validations.each do |name, options|
          # TODO allow apps to define their own validators
          validator_class = "Lotion::#{name.to_s.classify}Validator".constantize
          validators[ attribute ] << validator_class.new( options )
        end
      end

      ##
      # The declared validators for this class, keyed on attribute.
      # Not part of the public API.
      def validators
        @validators ||= Hash.new { |h, k| h[ k ] = [ ] }
      end
    end
  end
end
