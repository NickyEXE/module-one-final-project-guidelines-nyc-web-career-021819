require_relative '../config/environment'
require_relative "../cli/api_communicator.rb"
require_relative "../cli/CLI.rb"

welcome
location = get_location_from_user
hash = find_karaoke_places_near_location(location)
top_five_printer(hash)


#WHERE YOU AT?
#Here are 5 karaoke places by you.
##EVENTUALLY we should which you've sung at
#Do you want to sing at any of these?


#if no -- then it prompts you "find five more?" or "add new location"
#if yes, which of these do you want to hit up?
#welcome to NAME, "Do you want to add a song?" "Do you want to see your saved songs?"
