def welcome
  puts "Welcome to MicDropper, your one stop shop for places to sing the top of the pops.
  "
end

def get_location_from_user
  puts "Where do you want to drop the mic?

  Give me your zip code, city, area, whatever.
  "
  location = gets.chomp()
end

def top_five_printer(hash)
  i = 0
  hash["businesses"].first(5).each do |business|
    i +=1
    puts "#{i}. #{business['name']}"
    business["location"]["display_address"].each do |address_line|
      puts address_line
    end
  end
end
