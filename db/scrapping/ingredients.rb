require "open-uri"
require "nokogiri"


url = "https://food.ndtv.com/ingredient/#{category}/page-1"

html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search(".standard-card-new__article-title").each do |element|
  puts element.text.strip
  puts element.attribute("href").value
end
