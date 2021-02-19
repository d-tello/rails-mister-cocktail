# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Cocktail.destroy_all
Ingredient.destroy_all
Dose.destroy_all

puts 'Creating ingredients...'
Ingredient.create(name: 'Lemon')
Ingredient.create(name: 'Ice')
Ingredient.create(name: 'Vodka')
Ingredient.create(name: 'Ginger beer')
Ingredient.create(name: 'Freshly squeezed lime juice')
Ingredient.create(name: 'Lime, cut into wedges')
Ingredient.create(name: 'Sprigs mint')
Ingredient.create(name: 'White Cuban Ron')
Ingredient.create(name: 'Sugar')
