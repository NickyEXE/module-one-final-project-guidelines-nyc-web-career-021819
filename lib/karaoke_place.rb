class KaraokePlace < ActiveRecord::Base
  has_many :karaoke_entries
  has_many :songs, through: :karaoke_entries
end
