module Lotion
  class Logger

    def info( message )
      caller.first.match /(.+):(\d+):in `(\w+)'/ do |m|
        # FIXME looks like Kernel#sprintf might be buggy.
        # Try that instead of interpolation here and you get:
        # malloc: *** error for object 0xa97a760: pointer
        # being freed was not allocated
        puts "[#{m[1]}:#{m[3]}(#{m[2]})] #{message}"
      end
    end
  end
end
