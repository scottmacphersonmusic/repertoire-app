class Suggestion < ActiveRecord::Base
  belongs_to :practice_session

  before_save do
    self.song_id = select_song.id
    self.song_title = song.title
    self.key = select_key
    self.instrument_name = select_instrument_name
  end

  KEYS = %w(A Bb B C C#/Db D Eb E F F#/Gb G Ab)

  def songs
    practice_session.songs
  end

  def song
    Song.find(song_id)
  end

  def select_song
    songs.where(selected: true).sample
  end

  def select_key
    if song.comfort <=3
      song.key
    else
      KEYS.sample
    end
  end

  def select_instrument_name
    selected_instruments.map(&:name).sample
  end

  private

  def selected_instruments
    Instrument.where(selected: true)
  end
end
