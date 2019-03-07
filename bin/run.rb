require_relative '../config/environment'
# require_relative "../cli/api_communicator.rb"
# require_relative "../cli/CLI.rb"
# require_relative "../cli/print_and_pick.rb"
# require_relative "../cli/in_karaoke_place.rb"

#welcomes the user
def runner
  welcome
  ask_how_they_want_to_search
  #get_location_from_user asks the user where they want to sing,
  #Gets.chomp the location (a string) from the user,
  #stores it as a variable named "location" in run.rb
  #karaoke_place = print_and_pick(business_hashes,0)

  #Including this so that it ends successfully if the user does not pick a place
  # if karaoke_place.class == KaraokePlace
  #   input = karaoke_place_welcome(karaoke_place)
  #
  # end
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
