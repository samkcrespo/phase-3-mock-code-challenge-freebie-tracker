# FIRST THING TO DO WHEN SEEDING IS DELETE YOUR DATABASE
puts "Removing old data..."
Company.delete_all
Dev.delete_all
Freebie.delete_all

puts "Creating companies..."
c1 = Company.create(name: "Google", founding_year: 1998) # id => 45678agaGDAGAGA9
c2 = Company.create(name: "Facebook", founding_year: 2004)
c3 = Company.create(name: "Dunder Mifflin", founding_year: 2002)
c4 = Company.create(name: "Enron", founding_year: 1995)

puts "Creating devs..."
d1 = Dev.create(name: "Rick")
d2 = Dev.create(name: "Morty")
d3 = Dev.create(name: "Mr. Meseeks")
d4 = Dev.create(name: "Gazorpazop")

puts "Creating freebies..."

# ***************************************************************
# * TODO: create freebies! Remember, a freebie belongs to a dev *
# * and a freebie belongs to a company.                         *
# ***************************************************************

Freebie.create(item_name: "socks", value: 10, dev_id: d1.id, company_id: c1.id)
Freebie.create(item_name: "mug", value: 10, dev_id: d1.id, company_id: c2.id)
Freebie.create(item_name: "grizzly bear", value: 11, dev_id: d3.id, company_id: c1.id)
Freebie.create(item_name: "pen", value: 50, dev_id: d2.id, company_id: c2.id)
Freebie.create(item_name: "oatmeal", value: 1000, dev_id: d4.id, company_id: c1.id)

# ! WITH BELONGS_TO TABLE
# Freebie.create(item_name: "socks", value: 10, dev: d1, company: c1)
# Freebie.create(item_name: "pen", value: 50, dev: d2, company: c2)
# Freebie.create(item_name: "mug", value: 10, dev: d1, company: c2)
# Freebie.create(item_name: "grizzly bear", value: 11, dev: d3, company: c1)
# Freebie.create(item_name: "oatmeal", value: 1000, dev: d4, company: c1)

puts "Seeding done!"
