class AddSelectedToSong < ActiveRecord::Migration
  def change
    add_column :songs, :selected, :boolean, default: true
  end
end
