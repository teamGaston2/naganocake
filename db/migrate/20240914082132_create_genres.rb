class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.integer :genre_id
      t.string :name

      t.timestamps
    end
  end
end
