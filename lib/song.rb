class Song < ActiveRecord::Base
  has_many :karaoke_entries
  has_many :karaoke_places, through: :karaoke_entries

  def book_entry
    entry = karaoke_entries.find_by(:song_id == self.id)
    if entry == nil
    else
      puts "#{entry.book_number}. #{self.name}"
    end
  end


end
