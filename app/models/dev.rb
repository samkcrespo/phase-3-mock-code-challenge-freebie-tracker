class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies
    # many_to_many :devs

    # Dev#received_one?(item_name)
    # accepts an item_name (string) and returns true if any of the freebies associated with the dev has that item_name, otherwise returns false

    def received_one?(item_name)
        
        # ! AR LAND
        self.freebies.where(item_name: item_name).any?
        
        # ! RUBY LAND
        # filtered_freebies = self.freebies.filter do |freebie|
        #     freebie.item_name == item_name
        # end
        # return filtered_freebies.length > 0
    end


    # Dev#give_away(dev, freebie)
    # accepts a Dev instance and a Freebie instance, changes the freebie's dev to be the given dev; your code should only make the change if the freebie belongs to the dev who's giving it away
    def give_away(other_dev, freebie)

        # if the freebie doens't belong to the dev, skip
        if freebie.dev_id == self.id
            # freebie.dev_id = other_dev.id
            # freebie.save
            freebie.update(dev_id: other_dev.id)
            "YAY"
        else
            "nah..."
        end
    end

end
