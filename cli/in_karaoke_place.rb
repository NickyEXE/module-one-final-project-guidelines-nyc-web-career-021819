def karaoke_place_welcome(karaoke_place)
  puts "Welcome to #{karaoke_place.name}. Here are your saved songs:
  "
  karaoke_place.print_book
  puts "
  Here's what you can do:
  1. Add a song to a song library.
  2. Update information about a song.
  3. Remove a song from the song library.
  4. Exit the program.
  ************************************

  "
  #need to add see more information about a song.
  #back button
  input = gets.chomp()
  karaoke_landing_page_input_interpretter(input,karaoke_place)
end

def karaoke_landing_page_input_interpretter(input,karaoke_place)
  case input
  when "1"
    add_song_to_code_library(karaoke_place)
  when "2"
    pick_song_to_update(karaoke_place)
  when "3"
    puts "Which song do you want to remove? (Please use book number)"
    input2 = gets.chomp()
    KaraokeEntry.all
    remove_song_from_song_library(karaoke_place,input2)
  when "4"
  when "exit"
  when "Exit"
  when "EXIT"
  else
    puts "WORK IN PROGRESS COME BACK LATER"
    karaoke_place_welcome(karaoke_place)
  end
end


def add_song_to_code_library(karaoke_place)
  puts "What song do you want to add?"
  song_name = gets.chomp()
  song = add_song_by_title(song_name)
  #if song is listed in karaoke_place, then bypass next step
  if karaoke_place.has_song?(song)
    puts "
  We have that song! Returning you to the #{karaoke_place.name} lobby.

  "
  else
    puts "Enter its song code:"
    song_code = gets.chomp()
    entry = add_entry_by_title(karaoke_place.id, song.id, song_code)
  end
  karaoke_place_welcome(karaoke_place)
end

#Must be paired with add_entry_by_title
def add_song_by_title(song_name)
  if Song.all.find_by(name: song_name)
    song = Song.all.find_by(name: song_name)
    if song.artist != nil
      puts "Do you mean #{song_name} by #{song.artist}? Y/N"
      input = gets.chomp()
      if input == "Y"
        song
      elsif input == "N"
        puts "Who wrote the song you're trying to add?"
        input2 = gets.chomp()
        Song.create(name: song_name, artist: input2)
      else
        puts "That wasn't a Y or an N, we're going to go with Y."
        song
      end
    else
      puts "Help us out here. We have a song in our database
      with that name, but without an artist listed. Who is the
      artist for #{song.name}?"
      artist_name_input = gets.chomp()
      Song.update(song.id, :artist => artist_name_input)
      song
    end
  else
    Song.create(name: song_name)
  end
end

def add_entry_by_title(karaoke_id, song_id, song_code)
  KaraokeEntry.create(karaoke_id: karaoke_id, song_id: song_id, book_number: song_code)
end

def remove_song_from_song_library(karaoke_place,input)
  entry = KaraokeEntry.find_by book_number: input, karaoke_id: karaoke_place.id
  KaraokeEntry.all.destroy(entry.id)
  karaoke_place_welcome(karaoke_place)
end
