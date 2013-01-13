# require form/delegate

module Lotion
  module Form
    include Delegate

    def init
      super && initWithStyle( UITableViewStyleGrouped )
    end
  end
end
