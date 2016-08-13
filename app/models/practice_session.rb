class PracticeSession < ActiveRecord::Base
  validate :repertoire_has_song

  belongs_to :repertoire
  has_many :songs, through: :repertoire

  def repertoire_has_song
    if repertoire.songs.none?
      errors.add :repertoire, 'must have at least one song to practice'
    end
  end
end
