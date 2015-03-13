# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Pet.create(name: 'Fluffy', pet_type: 1, pet_status: "Available", age: "6 months", description: "loveable and cuddly")
Pet.create(name: 'Geronimo', pet_type: 0, pet_status: "Available", age: "1 year", description: "drama queen but sweet")
Pet.create(name: 'Muffins', pet_type: 1, pet_status: "Available", age: "9 months", description: "frisky and energetic")
Pet.create(name: 'Bombadil', pet_type: 0, pet_status: "Available", age: "3 years", description: "very loyal and social")