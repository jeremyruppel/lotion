# require actor

module Lotion
  class Command < Struct.new( :notification )
    include Lotion::Actor

    abstract!

    delegate :name, :object, :userInfo, :to => :notification

    alias :payload :userInfo

    ##
    #
    # TODO this could be a macro on Module
    def call
      raise NotImplementedError, 'Lotion::Command subclasses are expected to define #call'
    end

    ##
    #
    def self.call( notification )
      new( notification ).call
    end
  end
end
