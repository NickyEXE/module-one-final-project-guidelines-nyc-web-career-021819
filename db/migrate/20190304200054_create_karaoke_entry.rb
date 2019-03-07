class CreateKaraokeEntry < ActiveRecord::Migration[5.0]
  def change
    create_table :karaoke_entries do |t|
      t.integer :karaoke_id
      t.integer :song_id
      t.integer :book_number
    end
  end
end
