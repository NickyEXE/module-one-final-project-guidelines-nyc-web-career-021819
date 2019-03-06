def karaoke_place_welcome(karaoke_place)
  puts "Welcome to #{karaoke_place.name}. Here are your saved songs.
  "
  karaoke_place.print_song_library
  puts " Would you like to add a song to the song library? Y/N"
  input = gets.chomp()
  karaoke_landing_page_input_interpretter(input,karaoke_place)
end

def karaoke_landing_page_input_interpretter(input,karaoke_place)
  case input
  when "Y"
    add_song_to_code_library(karaoke_place)
  else
    puts "WORK IN PROGRESS COME BACK LATER"
  end
end


def add_song_to_code_library(karaoke_place)
  puts "What song do you want to add?"
  song_name = gets.chomp()
  song = add_song_by_title(song_name)
  song_code = gets.chomp()
  entry = add_entry_by_title(karaoke_place.id, song.id, song_code)
end

#Must be paired with add_entry_by_title
def add_song_by_title(song_name)
  if Song.all.find_by(name: song_name)
    puts "That song already exists here. Update it's number or type 'NO'"
    #NEED TO FIND IT'S NUMBER IN ENTRY_TABLE
    Song.all.find_by(name: song_name)
    #WE should update this to produce an array of possible songs if there's a bunch of songs by the same title
  else
    puts "Enter its song code:"
    Song.create(name: song_name)
  end
end

def add_entry_by_title(karaoke_id, song_id, song_code)
  KaraokeEntry.create(karaoke_id: karaoke_id, song_id: song_id, book_number: song_code)
end


# def karaoke_place_main_page_input_interpreter(input)
#   case input
#   when 1
#     song_library
#
#   when 2
#     add_song_to_code_library
# end


#need a landing page for playlist of songs that includes deleting
