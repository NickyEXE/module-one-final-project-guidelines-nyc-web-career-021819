require_relative '../config/environment'
require_relative "../cli/api_communicator.rb"
require_relative "../cli/CLI.rb"

welcome
location = get_location_from_user
hash = find_karaoke_places_near_location(location)
top_five_printer(hash)
picked_number = get_karaoke_establishment_from_user(hash)
karaoke_selected_place = picker(hash, picked_number)

binding.pry
#WHERE YOU AT? DONE
#Here are 5 karaoke places by you. DONE
##EVENTUALLY we should which you've sung at
#Do you want to sing at any of these?


#if no -- then it prompts you "find five more?" or "add new location"
#if yes, which of these do you want to hit up? DONE
#welcome to NAME, "Do you want to add a song?" "Do you want to see your saved songs?"
