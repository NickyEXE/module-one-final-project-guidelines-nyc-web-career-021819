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
