class Suggestion < ActiveRecord::Base
  belongs_to :practice_session

  def songs
    practice_session.songs
  end

  def select_song_title
    songs.map(&:title).sample
  end

  def select_instrument
    Instrument.where(selected: true).map(&:name).sample
  end
end
