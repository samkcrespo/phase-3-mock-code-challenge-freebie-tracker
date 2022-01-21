class Freebie < ActiveRecord::Base
  belongs_to :dev
  belongs_to :company

# should return a string formatted as follows: {insert dev's name} owns a {insert freebie's item_name} from {insert company's name}

  # def dev
  #   self.dev
  # end

  # def print_details
  #   "#{dev.name} owns a #{item_name} from #{company.name}"
  # end
end
