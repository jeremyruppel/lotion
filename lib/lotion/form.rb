# require form/data_source
# require form/delegate

module Lotion
  module Form
    include DataSource
    include Delegate

    def init
      super && initWithStyle( UITableViewStyleGrouped )
    end
  end
end
