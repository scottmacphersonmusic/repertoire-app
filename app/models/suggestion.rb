class Suggestion < ActiveRecord::Base
  belongs_to :practice_session

  def songs
    practice_session.songs
  end

  def select_song_title
    songs.map(&:title).sample
  end

  def select_instrument_name
    selected_instruments.map(&:name).sample
  end

  private

  def selected_instruments
    Instrument.where(selected: true)
  end
end
