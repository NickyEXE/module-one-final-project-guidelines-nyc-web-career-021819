require_relative '../config/environment'
require_relative "../cli/api_communicator.rb"
require_relative "../cli/CLI.rb"
require_relative "../cli/print_and_pick.rb"
require_relative "../cli/in_karaoke_place.rb"

#welcomes the user
def runner
  welcome
  #get_location_from_user asks the user where they want to sing,
  #Gets.chomp the location (a string) from the user,
  #stores it as a variable named "location" in run.rb
  location = get_location_from_user

  #Pulls a raw_hash of businesses from the Yelp API for Karaoke
  #in the location provided by the user
  raw_hash = find_karaoke_places_near_location(location)

  #Cleans the hash, makes it an array of businesses, and sorts by rating
  business_hashes = produce_cleaned_array_of_businesses_from_yelp_raw_hash_sorted_by_rating(raw_hash)


  karaoke_place = print_and_pick(business_hashes,0)
  #Including this so that it ends successfully if the user does not pick a place
  if karaoke_place.class == KaraokePlace
    input = karaoke_place_welcome(karaoke_place)
  end

end

runner


binding.pry
#WHERE YOU AT? DONE
#Here are 5 karaoke places by you. DONE
##EVENTUALLY we should which you've sung at
#Do you want to sing at any of these?


#if no -- then it prompts you "find five more?" or "add new location"
#if yes, which of these do you want to hit up? DONE
#welcome to NAME, "Do you want to add a song?" "Do you want to see your saved songs?"
