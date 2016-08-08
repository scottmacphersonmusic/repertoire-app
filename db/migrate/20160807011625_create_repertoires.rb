class CreateRepertoires < ActiveRecord::Migration
  def change
    create_table :repertoires do |t|
      t.timestamps null: false
    end
  end
end
