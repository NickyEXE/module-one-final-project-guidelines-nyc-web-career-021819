class KaraokeEntry < ActiveRecord::Base
  belongs_to :karaoke_place
  belongs_to :song
end
