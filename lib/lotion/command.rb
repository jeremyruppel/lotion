# require injectable

module Lotion
  class Command
    include Lotion::Injectable

    def execute
      raise NotImplementedError
    end
  end
end
