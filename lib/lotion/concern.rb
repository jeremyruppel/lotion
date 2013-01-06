module Lotion
  module Concern

    ##
    #
    def included( base=nil, &block )
      if const_defined?( :ClassMethods )
        base.extend const_get( :ClassMethods )
      end

      @included_blocks ||= [ ]

      if block_given?
        @included_blocks << block
      else
        @included_blocks.each { |blk| base.class_eval &blk }
      end
    end
  end
end
