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

Freebie.create(item_name: "Darkwing Duck", value: 50, dev_id: d1.id, company_id: c3.id)
Freebie.create(item_name: "Flamethrower", value: 400, dev_id: d2.id, company_id: c3.id)
Freebie.create(item_name: "Arrow to the Knee", value: 1, dev_id: d2.id, company_id: c1.id )
Freebie.create(item_name: "Pet Rock", value: 999, dev_id: d3.id , company_id: c2.id)

puts "Seeding done!"
