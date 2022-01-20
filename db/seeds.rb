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

puts "Seeding done!"
