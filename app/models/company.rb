class Company < ActiveRecord::Base
  has_many :freebies
  has_many :devs, through: :freebies

  def give_freebie(dev, item_name, value)
    # creates a new Freebie instance associated with this company and the given dev
    # ! All the same
    # Freebie.create(item_name: item_name, value: value, company_id: self.id, dev_id: dev.id)
    Freebie.create(item_name: item_name, value: value, company: self, dev: dev)

    # ? Phil's choice
    # self.freebies.create(item_name: item_name, value: value, dev_id: dev.id)

    # dev.freebies.create(item_name: item_name, value: value, company_id: self.id)

  end

  # ! CLASS METHOD!

  def self.oldest_company
    self.order(:founding_year).first
  end
  
  def self.oldest_company_ar
    # SELECT "companies".* FROM "companies" ORDER BY "companies"."founding_year" ASC, LIMIT 1
    # ! BEST SQL OPTION
    p1 = Time.now.to_f * 1000
    oldest = self.order(:founding_year).first
    p2 = Time.now.to_f * 1000
    # puts "Time for AR-SQL #{p2 - p1}"
    return p2 - p1
  end

  def self.oldest_company_ruby  
    # ! AIGHT RUBY OPTION
    # SELECT "companies".* FROM "companies"
    p1 = Time.now.to_f * 1000
    oldest = self.all.sort_by(&:founding_year).first
    p2 = Time.now.to_f * 1000
    # puts "Time for RUBY #{p2 - p1}"
    return p2 - p1
  end
  
  # returns the Company instance with the earliest founding year
end
