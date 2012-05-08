module Lotion
  module Concern

    def self.extended( base )
      base.instance_exec do

        def included( base=nil, &block )
          if block_given?
            @_included_block = block
          else
            if const_defined? :ClassMethods
              base.extend const_get( :ClassMethods )
            end
            if @_included_block
              base.class_eval &@_included_block
            end
          end
        end
      end
    end
  end
end
