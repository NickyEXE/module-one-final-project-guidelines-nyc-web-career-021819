class CreateFavoriteColumn < ActiveRecord::Migration[5.0]
  def change
    add_column(:karaoke_places, :favorites, :boolean)
  end
end
