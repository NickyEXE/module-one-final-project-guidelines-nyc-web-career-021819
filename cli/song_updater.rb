def pick_song_to_update(karaoke_place)
  puts "
  Which song do you want to update? (use book number)
  [To go back to the #{karaoke_place.name} lobby, type 'EXIT']
  **************
  "
  karaoke_place.print_book
  input = gets.chomp()
  if input == "EXIT"
    karaoke_place_welcome(karaoke_place)
  else
    entry = KaraokeEntry.find_by book_number: input, karaoke_id: karaoke_place.id
    if entry.class == KaraokeEntry
      entry.song.info_prompter(karaoke_place)
    else
      puts "Invalid input!"
      pick_song_to_update(karaoke_place)
    end
  end
end
#make a class method for song
