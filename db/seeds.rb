require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'nokogiri'

url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/random?number=10")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'
request["x-rapidapi-key"] = ENV["X_RAPIDAPI_KEY"]

response = http.request(request)
content = JSON.parse(response.body)
User.create(email: 'afonso@lewagon.com', password: '123456')

content['recipes'].each do |recipe|
  recipe['extendedIngredients'].each do |ingredient|
    unless category = Category.find_by(name: ingredient['aisle'])
      category = Category.create!(name: ingredient['aisle'])
    end

    unless desired_ingredient = Ingredient.find_by(name: ingredient['name'])
      desired_ingredient = Ingredient.create!(name: ingredient['name'], category: category, image: "https://spoonacular.com/cdn/ingredients_100x100/#{ingredient['image']}")
    end

    unless desired_recipe = Recipe.find_by(name: recipe['title'])
      desired_recipe = Recipe.create!(name: recipe['title'], dish_types: recipe['dishTypes'], instructions: recipe['instructions'], image: recipe['image'], servings: recipe['servings'])
    end

    unless RecipeIngredient.find_by(recipe: desired_recipe, ingredient: desired_ingredient)
      RecipeIngredient.create!(recipe: desired_recipe, ingredient: desired_ingredient, amount: ingredient['amount'], unit: ingredient['unit'] )
    end
  end
end

puts "Created #{Recipe.count} recipes, #{Ingredient.count} ingredients, #{Category.count} categories"
