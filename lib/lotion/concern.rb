module Lotion
  module Concern

    def self.extended( base )
      base.instance_exec do

        def included( base=nil, &block )
          if const_defined?( :ClassMethods )
            base.extend const_get( :ClassMethods )
          end
        end
      end
    end
  end
end
