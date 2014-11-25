require 'sinatra'
require 'pry'
require 'net/http'
require 'nokogiri'
require 'open-uri'


def get_html
	
	if params[:search_item].empty?
		search_parameter = "Yellowstone_National_Park"
	else
		search_parameter = params[:search_item]
	end	
	
	url = "http://en.wikipedia.org/wiki/#{search_parameter}"
	doc = Nokogiri::HTML(open(url).read)
  #binding.pry
	characters = doc.css("#mw-content-text p")
	latitude = doc.css(".latitude").first.to_s
	longitude= doc.css(".longitude").first.to_s
	
  paragraph = characters.first.to_s
  content = " Coordinates  ---  Latitude : #{latitude} 
  Longitude : #{longitude} 
  #{paragraph}"
end 

get '/' do
	@content = get_html
	erb :index
end





