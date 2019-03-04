class CreateKaraoke < ActiveRecord::Migration[5.0]
  def change
    create_table :karaoke_places do |t|
      t.string :name
      t.string :location
    end
  end
end
