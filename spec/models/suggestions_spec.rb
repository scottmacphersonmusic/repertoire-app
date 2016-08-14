require 'rails_helper'

describe Suggestion do
  before do
    @repertoire = create :repertoire
    3.times { @repertoire.songs << create(:song) }
    practice_session = create(:practice_session, repertoire_id: @repertoire.id)
    @suggestion = practice_session.suggestions.create!
  end

  it 'should have a method to access available songs' do
    expect(@suggestion.songs.map(&:id)).to eq @repertoire.songs.map(&:id)
  end

  it 'should select a song title at random' do
    song_titles = @suggestion.songs.map(&:title)

    expect(song_titles).to include(@suggestion.select_song_title)
  end

  it 'should select an instrument at random' do
    3.times do
      create :instrument, selected: true
      create :instrument, selected: false
    end
    selected_instruments = Instrument.where(selected: true).map(&:name)

    expect(selected_instruments).to include(@suggestion.select_instrument)
  end
end
