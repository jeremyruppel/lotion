# require actor

module Lotion
  class Command < Lotion::Actor

    # inject :app, Lotion::Application

    def call
      raise NotImplementedError
    end
  end
end
