require 'sinatra'
require 'pry'
require 'nokogiri'
require 'open-uri'


def get_parse_html
    
    search_item = params[:search_item]
   
	
    if search_item == '' ||  search_item == nil
		search_parameter = "Yellowstone_National_Park"
	else
        search_item = search_item.split(' ').each { | word | word.capitalize! }.join(' ')
       
		if search_item.strip.size > 1 
      		search_item = search_item.split(' ').join('_')
		end	
		
		
		search_parameter = search_item
	end	
	
	
	url = "http://en.wikipedia.org/wiki/#{search_parameter}"
	doc = Nokogiri::HTML(open(url).read)
  
	characters = doc.css("#mw-content-text p")
	
	latitude = doc.css(".latitude").first.to_s
	longitude= doc.css(".longitude").first.to_s
	
	paragraph = characters.first.to_s
	paragraph1 = characters[1].to_s
	search_parameter = search_parameter.split('_').join(' ')
	
    paragraph = paragraph.gsub(search_parameter, '---') 
	paragraph1 = paragraph1.gsub(search_parameter, '---')

	paragraph = paragraph.gsub(search_parameter.split(' ').first,'---') 
	paragraph1 = paragraph1.gsub(search_parameter.split(' ').first,'---')
	#binding.pry
  
  	characters = " Coordinates  ---  Latitude : #{latitude} 
  	Longitude : #{longitude} #{paragraph} #{paragraph1}"
  	
end 

get '/' do
	@content = get_parse_html
	erb :index
end






