require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'byebug'
require 'json'
require 'faker'


def getAllIngredients
  i = 0
  while i < 485 do
    Ingredient.create!(name: Faker::Food.unique.ingredient)
    i += 1
  end
end

def getAllFruits
  i = 0
  while i < 69 do
    Ingredient.create!(name: Faker::Food.unique.fruits)
    i += 1
  end
end

def getAllSpices
  i = 0
  while i < 183 do
    Ingredient.create!(name: Faker::Food.unique.spice)
    i += 1
  end
end

def getAllVegetables
  i = 0
  while i < 64 do
    Ingredient.create!(name: Faker::Food.unique.vegetables)
    i += 1
  end
end




getAllIngredients()
getAllFruits()
getAllSpices()
getAllVegetables()


# all_the_ingredients = Ingredient.create(hasher_turner_into(newArr))

# User.create(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , location: 'WA', email: 'alex@yahoo.com', password: 'test')
# User.create(first_name: 'Squidward', last_name: 'Tentacles', location: 'Unda Da Sea', email: 'squidward_tentacles@yahoo.com', password: 'test')
# User.create(first_name: 'A', last_name: 'Dog', location: 'NJ', email: 'doggo91@yahoo.com', password: 'test')
# User.create(first_name: 'Martha', last_name: 'Stewart', location: 'IN', email: 'martha_stewart@yahoo.com', password: 'test')
# User.create(first_name: 'Shakira', last_name: 'Shakira', location: 'NJ', email: 'shakira@yahoo.com', password: 'test')
