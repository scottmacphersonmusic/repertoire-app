class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :song_title
      t.string :key
      t.string :instrument
      t.references :practice_session, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
