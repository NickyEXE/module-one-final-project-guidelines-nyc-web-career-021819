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
