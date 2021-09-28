class Company < ActiveRecord::Base
  has_many :freebies
  # from Company to Devs (Many to Many)
  # Which means we need to go THROUGH a JOIN table
  has_many :devs, through: :freebies

  # - `Company#give_freebie(dev, item_name, value)`
  # - takes a `dev` (an instance of the `Dev` class), an `item_name` (string), and a `value`
  #   as arguments, and creates a new `Freebie` instance associated with this
  #   company and the given dev

  def give_freebie(dev, item_name, value)
    # freebie = Freebie.new
    # freebie.save
    Freebie.create(item_name: item_name, value: value, dev: dev, company: self)
    # ? Stemming off of one of our parent to child relationships
    # self.freebies.create(item_name: item_name, value: value, dev: dev) #No need to add the company: self
    # dev.freebies.create(item_name: item_name, value: value, company: self) #No need to add the dev: dev
  end

# - `Company.oldest_company`
#   - returns the `Company` instance with the earliest founding year

  def self.oldest_company
    # in ruby land, we'd have to loop through the .all array and find where founding_year is minimum
    self.all.sort_by(&:founding_year).first
    # self.all.sort_by do |c|
    #   c.founding_year
    # end

    # Sorting to SQL/AR
    self.order("founding_year").first
  end

end
