class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies
#   - `Dev#received_one?(item_name)`
#   - accepts an `item_name` (string) and returns true if any of the freebies
#     associated with the dev has that `item_name`, otherwise returns false

  def received_one?(item_name) # if making a boolean return method, you can add a question mark in ruby
    # Long ruby way .each
    # self.freebies.each do |f|
    #   p f
    #   if f.item_name == item_name
    #     return true
    #   end
    # end
    # return false

    # found_freebie = self.freebies.find do |f| 
    #   f.item_name == item_name
    # end
    # !!found_freebie

    # self.freebies.include? do |f| 
    #   f.item_name == item_name
    # end

    # SQL/AR
    !!self.freebies.find_by(item_name: item_name)
  end

# - `Dev#give_away(dev, freebie)`
#   - accepts a `Dev` instance and a `Freebie` instance, changes the freebie's dev
#     to be the given dev; your code should only make the change if the freebie
#     belongs to the dev who's giving it away

  def give_away(new_dev, freebie)
    # binding.pry
    # freebie.update(dev_id: new_dev.id)
    # what if the freebie does not belong to this dev?
    if freebie.dev_id == self.id
      freebie.update(dev: new_dev)
    else 
      p 'nah'
    end
  end
end
