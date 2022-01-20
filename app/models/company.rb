class Company < ActiveRecord::Base
  has_many :freebies
  has_many :devs, through: :freebies

  def give_freebie(dev, item_name, value)
    # creates a new Freebie instance associated with this company and the given dev
    # ! All the same
    Freebie.create(item_name: item_name, value: value, company_id: self.id, dev_id: dev.id)

    # ? Phil's choice
    # self.freebies.create(item_name: item_name, value: value, dev_id: dev.id)

    # dev.freebies.create(item_name: item_name, value: value, company_id: self.id)

  end

  # ! CLASS METHOD!
  def self.oldest_company
    # SELECT "companies".* FROM "companies" ORDER BY "companies"."founding_year" ASC, LIMIT 1
    # ! BEST SQL OPTION
    self.all.order(:founding_year).first
    # Company.all.order(:founding_year).first
    # Company.order(:founding_year).first

    # ! AIGHT RUBY OPTION
    # SELECT "companies".* FROM "companies"
    # self.all.sort_by(&:founding_year).first
  end
  
  # returns the Company instance with the earliest founding year
end
