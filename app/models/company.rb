class Company < ActiveRecord::Base
  has_many :freebies
  has_many :devs, through: :freebies

#   Company#give_freebie(dev, item_name, value) --> takes a dev(an instance of the Dev class), an item_name(string),and a value as arguments, and creates a new Freebie instance associated with this company and the given dev
def give_freebie(dev, item_name, value)
self.freebies.create(dev: dev, item_name: item_name, value: value)
end

# Company.oldest_company --> returns the Company instance with the earliest founding year

def self.oldest_company
self.order(:founding_year).first

### Not in deliverables but wanted practice --> 
def self.newest_company
self.order(:founding_year).last
end

def self.most_devs
all.max_by do |company|
company.devs.count
end

# self.joins(:freebies).joins(:devs).group("freebies.id").order("COUNT(devs.id) desc").first
end

end
