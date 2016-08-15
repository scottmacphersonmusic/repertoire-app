class AddSongReferenceToSuggestion < ActiveRecord::Migration
  def change
    add_reference :suggestions, :song, foreign_key: true
  end
end
