def welcome
  puts "Welcome to MicDropper, your one stop shop for places to sing the top of the pops.
  "
end

def get_location_from_user
  puts "Where do you want to drop the mic?

  Give me your zip code, city, area, whatever.

  (Hit EXIT to leave this program.)
  "
  location = gets.chomp()
end

# def get_karaoke_establishment_from_user(hash)
#   puts "Which of these places would you like to wreck with your karaoke skills?
#
#   "
#   num = gets.chomp()
#   num.to_i-1
# end

def picker(hash_array, number)
  name = hash_array[number]["name"]
  location = hash_array[number]["location"]["display_address"]

  #if karaoke place doesn't exist in database then create
  #NOTE WE'RE USING ** AS A DELIMITER
  if !KaraokePlace.all.locations.include?(location.join("**"))
    KaraokePlace.create(name: name,location: location.join("**"))
  else
    KaraokePlace.find_by(location: location.join("**"))
  end
end


0
