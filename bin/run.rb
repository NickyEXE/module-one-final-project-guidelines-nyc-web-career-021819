require_relative '../config/environment'
require_relative "../cli/api_communicator.rb"
require_relative "../cli/CLI.rb"

welcome
location = get_location_from_user
hash = find_karaoke_places_near_location(location)
puts hash
puts "HELLO WORLD"
