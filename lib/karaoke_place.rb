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

  def has_song?(song)
    self.songs.include?(song)
  end

#might be able to delete this
  def print_song_library
    songs.each do |song|
      song.book_entry(self)
    end
  end

  def print_book
    songs.each do |song|
      song.full_entry(self)
    end
  end

  def saved_songs_descripter
    if self.songs.length >0
      "Here are your saved songs: "
    else
      "You have no saved songs at #{self.name}."
    end
  end

end
