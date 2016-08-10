class AddRepertoireIdToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :repertoire_id, :integer
  end
end
