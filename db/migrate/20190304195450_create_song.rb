class CreateSong < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.integer :year
    end
  end
end
