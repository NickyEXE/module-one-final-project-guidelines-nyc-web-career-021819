class Song < ActiveRecord::Base
  has_many :karaoke_entries
  has_many :karaoke_places, through: :karaoke_entries
end
