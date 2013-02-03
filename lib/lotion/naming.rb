module Lotion
  module Naming

    ##
    # The concern of this class, only if it descends from
    # an abstract class.
    def concern
      class_name[ /^(\w+)#{class_type}$/, 1 ].underscore
    end

    ##
    # The abstract type of this class, if any.
    def class_type
      self.class.ancestors.find( &:abstract? ).abstract_type
    end

    ##
    # The class name of this actor.
    def class_name
      self.class.to_s
    end
  end
end
