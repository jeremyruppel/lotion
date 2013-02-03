module Lotion
  class Errors < Hash

    def initialize
      super( ){ |h, k| h[ k ] = [ ] }
    end

    def full_messages
      reduce( [ ] ) do |arr, (key, messages)|
        # TODO need to use #titleize here where it gets written
        attribute = key.to_s.capitalize
        arr.push *messages.map { |message| "#{attribute} #{message}" }
      end
    end
  end
end
