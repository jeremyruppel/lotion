# require form/data_source
# require form/delegate

module Lotion
  module FormViewController
    include DataSource
    include Delegate

    def init
      super && initWithStyle( UITableViewStyleGrouped )
    end
  end
end
