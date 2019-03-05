class KaraokePlace < ActiveRecord::Base
  has_many :karaoke_entries
  has_many :songs, through: :karaoke_entries

  def self.locations
    self.all.map do |kplace|
      kplace.location
    end
  end



end
