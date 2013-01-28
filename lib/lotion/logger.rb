module Lotion
  class Logger

    ##
    #
    def info( message )
      if caller.any? && caller.first.match( /(.+):(\d+):in `(\w+)'/ )
        puts "[%s:%s(%s)] \e[1m%s\e[0m" % [ $1, $3, $2, message ]
      else
        puts "[(anonymous)] %s" % [ message ]
      end
    end
  end

  ##
  # Access to the current logger.
  def self.logger
    @logger ||= Logger.alloc
  end
end
