class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def received_one?(item_name)
    # accepts an item_name (string) and returns true if any of the freebies associated with the dev has that item_name, otherwise returns false
    # SELECT "freebies".* FROM "freebies" WHERE "freebies"."dev_id" = ? AND "freebies"."item_name" = ? LIMIT ? 
    # ! IN AR LAND
    !!self.freebies.find_by(item_name: item_name)

    # self.freebies.pluck(:item_name).include?(item_name)

    # ! IN RUBY LAND
    # output = false
    # self.freebies.each do |f|
    #   if f.item_name == item_name
    #     output = true
    #     break
    #   end
    # end
    # output
  end

  def give_away(dev, freebie)
   
    # first check if the self has this freebie
    if self.received_one?(freebie.item_name)
      # freebie.dev_id = dev.id
      # freebie.save
      # freebie.update(dev_id: dev.id)
      # * REF
      freebie.update(dev: dev)
      puts "Successful!"
    else 
      puts "you don't own that, broh"
    end

  end
end
