require "open-uri"
require "nokogiri"
require "byebug"

puts "Creating Categories..."

Category.create!(name: 'Vegetables')
Category.create!(name: 'Spices and Herbs')
Category.create!(name: 'Cereals and Pulses')
Category.create!(name: 'Meat')
Category.create!(name: 'Dairy Products')
Category.create!(name: 'Fruits')
Category.create!(name: 'Seafood')
Category.create!(name: 'Sugar and Sugar Products')
Category.create!(name: 'Nuts and Oilseeds')
Category.create!(name: 'Other Ingredients')

puts "Created #{Category.count} categories (must be 10)!"

puts "Creating ingredients..."

Category.all.each do |category|
  i = 1
  name = category.name.gsub(" ", "-")
  url = "https://food.ndtv.com/ingredient/#{name}/page-1"

  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML(html_file)
  pages = html_doc.search("#pagination").children.children.children.text.split("")
  pages.pop(6)

  if pages.pop.to_i >= i
    url = "https://food.ndtv.com/ingredient/#{name}/page-#{i}"

    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)
    array = html_doc.search(".vdo_lst h3").map{|node| node.text}
    array.each do |ingredient|
      Ingredient.create!(name: ingredient, category_id: category.id)
    end
  end
  i += 1
end

puts "Created #{Ingredient.count} ingredients!"
