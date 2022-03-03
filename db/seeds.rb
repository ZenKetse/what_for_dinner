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

content['recipes'].each do |recipe|
  recipe['extendedIngredients'].each do |ingredient|
    category = Category.new(name: ingredient['aisle'])
      unless category.save
        category = Category.find_by(name: ingredient['aisle'])
      end
    desired_ingredient = Ingredient.new(name: ingredient['name'], category: category, image: "https://spoonacular.com/cdn/ingredients_100x100/#{ingredient['image']}")
      unless desired_ingredient.save
        desired_ingredient = Ingredient.find_by(name: ingredient['name'])
      end
    desired_recipe = Recipe.new(name: recipe['title'], dish_types: recipe['dishTypes'], instructions: recipe['instructions'])
      unless desired_recipe.save
        desired_recipe = Recipe.find_by(name: recipe['title'])
      end
    recipe_ingredient = RecipeIngredient.new(recipe: desired_recipe, ingredient: desired_ingredient, amount: ingredient['amount'])
      unless recipe_ingredient.save
        RecipeIngredient.find_by(recipe: recipe)
      end
  end
end

puts "Created #{Recipe.count} recipes, #{Ingredient.count} ingredients, #{Category.count} categories"
