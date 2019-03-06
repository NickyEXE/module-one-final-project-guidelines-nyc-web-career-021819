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
end
