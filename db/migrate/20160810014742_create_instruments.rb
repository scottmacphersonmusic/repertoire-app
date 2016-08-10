class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.string :name
      t.string :key
      t.boolean :selected, default: true

      t.timestamps null: false
    end
  end
end
