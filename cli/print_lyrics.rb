def lyrics_menu(karaoke_place)
  puts "These are all the songs that you have saved here:"
  karaoke_place.print_book
  puts "Which one do you want to find lyrics for? (use book number)"
  book_number = gets.chomp()
  entry = KaraokeEntry.find_by book_number: book_number, karaoke_id: karaoke_place.id
  if entry
    song = Song.find(entry.song_id)
    if song
      song.lyrics_printer
      sleep(2)
    else
      puts "We don't have a song matching that book number in our database. Returning you to the #{karaoke_place.name} lobby."
    end
  else
    puts "We don't have an entry matching that book number. Returning you to the #{karaoke_place.name} lobby."
  end
end
