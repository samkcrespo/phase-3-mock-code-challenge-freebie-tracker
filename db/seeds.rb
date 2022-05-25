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

# Freebie.create(item_name: 'Pop-Socket', value: 12, company_id: c1.id, dev_id: d2.id)
# Freebie.create(item_name: 'T-Shirt', value: 25, company_id: c2.id, dev_id: d2.id)
# Freebie.create(item_name: 'Sound Bar', value: 300, company_id: c3.id, dev_id: d1.id)
# Freebie.create(item_name: 'Pizza', value: 15, company_id: c1.id, dev_id: d3.id)
# Freebie.create(item_name: 'Tablet', value: 250, company_id: c4.id, dev_id: d1.id)
# Freebie.create(item_name: 'Pens', value: 10, company_id: c3.id, dev_id: d4.id)
# Freebie.create(item_name: 'Phone Case', value: 22, company_id: c2.id, dev_id: d4.id)
# Freebie.create(item_name: 'Hat', value: 20, company_id: c4.id, dev_id: d3.id)
# Freebie.create(item_name: 'Computer', value: 12, company_id: c1.id, dev_id: d1.id)
# Freebie.create(item_name: 'Shirt', value: 30, company_id: c4.id, dev_id: d2.id)

counter = 1

10.times do
  counter += 1
Freebie.create(
  dev: Dev.all.sample, 
  company: Company.all.sample, 
  value: rand(1..150), 
  item_name: "item #{counter}"
)
end


puts "Seeding done!"
