class Song < ActiveRecord::Base
  has_many :karaoke_entries
  has_many :karaoke_places, through: :karaoke_entries

#might be able to delete this
  def book_entry
    entry = karaoke_entries.find_by song_id: self.id
    if entry == nil
    else
      puts "#{entry.book_number}. #{self.name}"
    end
  end

  def full_entry
    entry = karaoke_entries.find_by song_id: self.id
    puts "#{entry.book_number}: #{self.name ||= "No song listed."}
    #{self.artist ||= "No artist listed."} (#{self.year ||= "No year listed."})"
  end

  def info_prompter(karaoke_place)
    puts "What do you want to update?
    1. Song Name
    2. Artist Name
    3. Year
    4. Exit (I did not mean to be here)"
    input1=gets.chomp()
    if input1 == "4"
      karaoke_place_welcome(karaoke_place)
    else
      puts "
      What do you want to update it to?"
      input2=gets.chomp()
      case input1
        when "1"
          Song.update(self.id, :name => input2)
          pick_song_to_update(karaoke_place)
        when "2"
          Song.update(self.id, :artist => input2)
          pick_song_to_update(karaoke_place)
        when "3"
          Song.update(self.id, :year => input2)
          pick_song_to_update(karaoke_place)
        else
          puts "Invalid input, please try again.
          "
          info_prompter(karaoke_place)
        end
      end
    end

    def lyrics_printer
      if !self.artist
        puts "We need to know the artist name for this song before we can give you its lyrics.

        Do you want to add an artist name? Y/N"
        input = gets.chomp()
        case input
        when "Y"
          #Finds the artist name, then re-calls the function with the updated song
          puts "What's the artist name?"
          artist_name=gets.chomp()
          self.update(artist: artist_name)
          self.lyrics_printer
        when "N"
          puts "Exiting."
        end
      else
        begin
          url = URI.escape("https://api.lyrics.ovh/v1/#{self.artist.downcase}/#{self.name.downcase}")
          response = RestClient.get url
        rescue RestClient::ExceptionWithResponse => e
          if e.class == RestClient::NotFound
            puts "I'm sorry, it looks like we don't have lyrics available for #{self.artist}'s #{self.name}'"
          end
        end
        if response
          puts JSON.parse(response)["lyrics"]
        end
      end
    end
  end
