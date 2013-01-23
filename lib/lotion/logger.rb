module Lotion
  class Logger

    def info( message )
      if caller.any? && caller.first.match( /(.+):(\d+):in `(\w+)'/ )
        # FIXME looks like Kernel#sprintf might be buggy.
        # Try that instead of interpolation here and you get:
        # malloc: *** error for object 0xa97a760: pointer
        # being freed was not allocated
        puts "[#{$1}:#{$3}(#{$2})] #{message}"
      else
        puts "[#{self}(anonymous)] #{message}"
      end
    end
  end
end
