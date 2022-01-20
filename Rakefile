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