class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :key
      t.string :quality
      t.integer :comfort
      t.references :repertoire, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
