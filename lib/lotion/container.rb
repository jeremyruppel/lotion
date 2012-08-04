# require concern

module Lotion
  module Container
    extend Lotion::Concern

    def startup!
      puts "OH SHIT STARTUP YO"
    end
  end
end
