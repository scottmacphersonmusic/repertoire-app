class CreatePracticeSessions < ActiveRecord::Migration
  def change
    create_table :practice_sessions do |t|
      t.references :repertoire

      t.timestamps null: false
    end
  end
end
