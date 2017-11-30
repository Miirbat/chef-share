require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'byebug'
require 'json'

# parsed_page = JSON.parse(page)

newArr = []

("a".."z").each do |letter|
  page = Nokogiri::HTML(open("http://www.bbc.co.uk/food/ingredients/by/letter/#{letter}"))
  page.css('#orb-modules').css('.resource').css('li').each do |x|
    newArr << x.text.strip
  end
end

def cleaner_upper array
  i = 0
  while i < array.length do
    if array[i] == " " && array[i + 1] == " "
      array.slice!(i, array.length)
    end
    i += 1
  end
end

newArr.each do |x|
  x.slice!('Related')
  x.slice!('(')
  x.slice!(')')
  cleaner_upper(x)
  x.downcase!
end

def hasher_turner_into array
  ingredients = []
  array.each do |x|
    ingredients << { name: "#{x}"}
  end
  ingredients
  byebug
end




# all_the_ingredients = Ingredient.create(hasher_turner_into(newArr))



# User.create(first_name: 'Alexa', last_name: ' ', location: 'WA', email: 'alex@yahoo.com', password: 'test')
# User.create(first_name: 'Squidward', last_name: 'Tentacles', location: 'Unda Da Sea', email: 'squidward_tentacles@yahoo.com', password: 'test')
# User.create(first_name: 'A', last_name: 'Dog', location: 'NJ', email: 'doggo91@yahoo.com', password: 'test')
# User.create(first_name: 'Martha', last_name: 'Stewart', location: 'IN', email: 'martha_stewart@yahoo.com', password: 'test')
# User.create(first_name: 'Shakira', last_name: 'Shakira', location: 'NJ', email: 'shakira@yahoo.com', password: 'test')
