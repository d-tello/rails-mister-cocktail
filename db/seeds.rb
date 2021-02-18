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
Ingredient.create(name: 'lemon')
Ingredient.create(name: 'ice')
Ingredient.create(name: 'mint leaves')

puts 'Creating cocktails...'
Cocktail.create(name: 'Mojito')
Cocktail.create(name: ' Long Island Iced Tea')
Cocktail.create(name: 'Manhattan')
Cocktail.create(name: 'Daiquiri')
Cocktail.create(name: 'Margarita')
Cocktail.create(name: 'Bloody Mary')
Cocktail.create(name: 'Cosmopolitan')
Cocktail.create(name: 'Tom Collins')

puts 'Finished!'
