class Repertoire < ActiveRecord::Base
  validates :name, presence: true

  has_many :songs
  has_many :practice_sessions

  def selected_songs_count
    selected_songs = songs.where selected: true

    "(#{selected_songs.count} of #{songs.count} selected)"
  end
end
