# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#f = File.open("books.txt", "r")
f = File.open(File.join(Rails.root, 'db', 'books.txt'))
f.each_line do |line|
  #get rid of newlines
  line = line.strip!
  arr = line.split(',')
  # we use strip! for author and language to remove the space after the comma
  Book.create(title: arr[0], author: arr[1].strip!, language: arr[2].strip!, year: arr[3], copies: arr[4])  
end
f.close

Team.create(name: 'Broncos', city: 'Denver').players.create([
{first_name: 'Peyton', last_name: 'Manning', jersey: 18, platoon: 'O'},
{first_name: 'Julius', last_name: 'Thomas', jersey: 80, platoon: 'O'},
{first_name: 'Demarius', last_name: 'Thomas', jersey: 88, platoon: 'O'},
{first_name: 'CJ', last_name: 'Anderson', jersey: 22, platoon: 'O'},
{first_name: 'DeMarcus', last_name: 'Ware', jersey: 94, platoon: 'D'},
{first_name: 'Aqib', last_name: 'Talib', jersey: 21, platoon: 'D'}
])