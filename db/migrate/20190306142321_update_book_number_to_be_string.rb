class UpdateBookNumberToBeString < ActiveRecord::Migration[5.0]
  def change
    change_column :karaoke_entries, :book_number, :string
  end
end
