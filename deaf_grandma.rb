

str="STARTING IN 1,2,3.."
ctr=0

while true
  puts "Enter Message"
  str=gets.chomp
           
  if str=="BYE" 
    ctr+=1
  else
    ctr=0
  end

    if ctr==3
      puts "I'M DONE HERE !"  
      break
    end
           
      if str!=str.upcase
	   puts "HUH?! SPEAK UP, SONNY!"
	 else
	   puts "NO, NOT SINCE #{1930+rand(1..50)}"
      end
	
end
