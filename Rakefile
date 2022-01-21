require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a Pry console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end

desc "Start app console in terminal"
task :c do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ARGV.clear
  cols = Rake.application.terminal_width
  system "clear"
  puts "*" * cols
  puts "    Welcome to the Rake Console    ".center(cols, "*")
  puts "*" * cols
  Pry.start
end

desc "Testing"
task :test do
  d1 = Dev.first
  d2 = Dev.second
  c1 = Company.first
  c2 = Company.second
  f1 = Freebie.first

  p d1.freebies
  p c1.freebies
  p f1.company
  p f1.dev
  p f1.print_details
end

desc "Test SQL SPEED"
task :testspeed do 
  ARGV.clear
  cols = Rake.application.terminal_width
  system "clear"
  puts "*" * cols
  puts "    Welcome to the Rake Console    ".center(cols, "*")
  puts "*" * cols

  oldest_one = Company.create(name:"oldy", founding_year: 1776)

  puts "Creating Companies..."
  new_companies = 1000
  new_companies.times do 
    Company.create(founding_year: rand(1991..2022))
  end
  
  ar_arr = []
  ruby_arr = []
  
  puts "Calculating Runs AR-SQL..."
  runs = 10000
  x = 1
  runs.times do
    print "Current Run: #{x}" + "\r"
    x += 1
    ar_arr << Company.oldest_company_ar
  end
  
  puts "Calculating Runs RUBY..."
  x = 1
  runs.times do 
    print "Current Run: #{x}" + "\r"
    x += 1
    ruby_arr << Company.oldest_company_ruby
  end
  
  ar_avg = ar_arr.sum / ar_arr.length
  ruby_avg = ruby_arr.sum / ruby_arr.length
  
  puts "RUNS: #{runs}\tNEW COMPANIES CREATED: #{new_companies + 1}"
  puts "AR-SQL  AVG:\t#{ar_avg}\tMAX: \t #{ar_arr.max}\tMIN: \t #{ar_arr.min}"
  puts "RUBY    AVG:\t#{ruby_avg}\tMAX: \t #{ruby_arr.max}\tMIN: \t #{ruby_arr.min}"
  
  # delete all test data
  puts "Deleting Companies..."
  oldest_one.delete
  new_companies.times do 
    Company.last.delete
  end
  puts "DONE!"
end

desc "Test Freebies"
task :test_freebies do
  f1 = Freebie.first
  begin
    p f1.class == Freebie
    p f1.company.name == "Dunder Mifflin"
    p f1.dev.name == "Rick"
    p f1.print_details == 'Rick owns a Darkwing Duck from Dunder Mifflin'
  rescue 
    puts "invalid method"
  end
end

desc "Test Companies"
task :test_companies do
  # Company#give_freebie(dev, item_name, value)
  # takes a dev (an instance of the Dev class), an item_name (string), and a value as arguments, and creates a new Freebie instance associated with this company and the given dev
  # Company.oldest_company
  # returns the Company instance with the earliest founding year
  # Dev
  c1 = Company.first

  p Company.oldest_company == Company.find_by(name: "Enron")

end