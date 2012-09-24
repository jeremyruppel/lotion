# require injectable
# require application

module Lotion
  class Command
    include Lotion::Injectable

    inject :app => Lotion::Application

    def execute
      raise NotImplementedError
    end
  end
end
