class KaraokeEntry < ActiveRecord::Base
  belongs_to :karaoke_place
  belongs_to :song

  def remove_by_book_number(entry)
    binding.pry
    id = KaraokeEntry.all.find_by(:book_number == entry).id
    KaraokeEntry.all.delete(id)
  end

end
