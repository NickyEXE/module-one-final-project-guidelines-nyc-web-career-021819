class KaraokePlace < ActiveRecord::Base
  has_many :karaoke_entries
  has_many :songs, through: :karaoke_entries

  def self.locations
    self.all.map do |kplace|
      kplace.location
    end
  end

  def print_location
    puts self.location.split("**")
    self.location
  end

  def karaoke_entries
    KaraokeEntry.all.select do |karaoke_entry|
      karaoke_entry.karaoke_id == self.id
    end
  end

  def songs
    self.karaoke_entries.map do |karaoke|
      karaoke.song
    end
  end

  def print_song_library
    songs.each do |song|
      song.book_entry
    end
  end

end
