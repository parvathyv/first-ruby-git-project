require 'sinatra'
require 'pry'
require 'nokogiri'
require 'open-uri'


def get_html
	
    if params[:search_item] == '' ||  params[:search_item] == nil
		search_parameter = "Yellowstone_National_Park"
	else
		search_parameter = params[:search_item]
	end	
	
	
	url = "http://en.wikipedia.org/wiki/#{search_parameter}"
	doc = Nokogiri::HTML(open(url).read)
  
	characters = doc.css("#mw-content-text p")
	
	latitude = doc.css(".latitude").first.to_s
	longitude= doc.css(".longitude").first.to_s
	
	paragraph = characters.first.to_s
	paragraph1 = characters[1].to_s
	paragraph = paragraph.gsub(search_parameter,'---')
	paragraph1 = paragraph1.gsub(search_parameter,'---')
  
  	characters = " Coordinates  ---  Latitude : #{latitude} 
  	Longitude : #{longitude} #{paragraph} #{paragraph1} #{image}"
  	
end 

get '/' do
	@content = get_html
	erb :index
end






