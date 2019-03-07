def ask_how_they_want_to_search
  puts "Do you know which Karaoke place you want to go to or do you want to find a karaoke spot in your area? (Type the number relating to your option below.)

  1. I know the karaoke spot I want to go to.
  2. I'm looking for a karaoke spot!
  3. I started using this program by accident and want to leave.
  "
  input = gets.chomp()
  case input
  when "1"
    karaoke_spot_find_by_name
  when "2"
    karaoke_spot_find_by_location
  when "3" || "exit" || "Exit" || "EXIT"
    puts "I hope you find what you're looking for. Goodbye."
  else
    puts "That was an invalid input. Try again!"
    ask_how_they_want_to_search
  end
end

def karaoke_spot_find_by_name
  puts "What's the name of the karaoke place you want to go to?"
  input1 = gets.chomp()
  if input1.downcase == "exit"
    puts "Exiting program."
  else
    puts "Where is #{input1}? (Enter a city)"
    input2 = gets.chomp()
    hash = search_yelp_by_name(input1, input2)
    clean_the_named_hash(hash)
  end
end


def clean_the_named_hash(hash)
  if hash.key?("error")
    puts "I hit an error. Are you sure you entered that correctly?"
    puts "Sending you back to confirm how you want to search."
    ask_how_they_want_to_search
  elsif hash["businesses"].length > 0
    #We should confirm it's the right one.
    karaoke_place = picker(hash["businesses"],0)
    check_if_it_is_the_right_place(karaoke_place)
  else
    puts "I hit an error. Are you sure you entered that correctly?"
    puts "Sending you back to confirm how you want to search."
    ask_how_they_want_to_search
  end
end

def check_if_it_is_the_right_place(karaoke_place)
  puts "
  We found the following place:"
  puts karaoke_place.name
  puts karaoke_place.location.split("**")
  puts "
  Is this where you want to go?
  Y/N or type EXIT to leave the program or BACK to go to the main menu."
  input = gets.chomp()
  case input
  when "Y"
    puts "Going to #{karaoke_place.name}."
    karaoke_place_welcome(karaoke_place)
  when "N"
    karaoke_spot_find_by_name
  when "back" || "Back" || "BACK"
    ask_how_they_want_to_search
  when "exit" || "Exit" || "EXIT"
    puts "I hope you find what you're looking for. Goodbye."
  else
    puts "That was an invalid input. Try again!"
    check_if_it_is_the_right_place(karaoke_place)
  end
end



def karaoke_spot_find_by_location
  #get_location_from_user asks the user where they want to sing,
  #Gets.chomp the location (a string) from the user,
  #stores it as a variable named "location" in run.rb
  #karaoke_place = print_and_pick(business_hashes,0)

  location = get_location_from_user

  if location.downcase == "exit"
  else
  #Pulls a raw_hash of businesses from the Yelp API for Karaoke
  #in the location provided by the user
  raw_hash = find_karaoke_places_near_location(location)
  #Cleans the hash, makes it an array of businesses, and sorts by rating
  business_hashes = produce_cleaned_array_of_businesses_from_yelp_raw_hash_sorted_by_rating(raw_hash)
    if business_hashes.length > 0
      iterator = printer(business_hashes,0)
      karaoke_pick_inputter(business_hashes,iterator)
    else
      puts "No karaoke places available at that location. Please choose another location.

      *******
      "
      runner
    end
  end
end

def get_location_from_user
  puts "Where do you want to drop the mic?

  Give me your zip code, city, area, whatever.

  (Hit EXIT to leave this program.)
  "
  location = gets.chomp()
end


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
