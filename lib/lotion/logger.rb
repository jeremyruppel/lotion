module Lotion
  class Logger

    def info( message )

      # FIXME `caller` was causing a malloc error when used
      # within a callback for a UIRefreshControl action.

      # We can either make the logger super weak like:
      # puts "[#{self.class.to_s}] #{message}"

      # Or we can warn the user that targets from UIControl#addTarget
      # are not retained, so they cannot rely on logger to be there.

      # This can actually be fixed by making the UIControl itself
      # the target and creating our own delegate protocol.

      if caller.any? && caller.first.match( /(.+):(\d+):in `(\w+)'/ )
        # FIXME looks like Kernel#sprintf might be buggy.
        # Try that instead of interpolation here and you get:
        # malloc: *** error for object 0xa97a760: pointer
        # being freed was not allocated
        puts "[#{$1}:#{$3}(#{$2})] #{message}"
      else
        puts "[#{self.to_s}(anonymous)] #{message}"
      end
    end
  end
end
