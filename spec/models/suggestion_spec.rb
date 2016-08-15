require 'rails_helper'

describe Suggestion do
  before do
    @repertoire = create :repertoire
    3.times { @repertoire.songs << create(:song) }
    practice_session = create(:practice_session, repertoire_id: @repertoire.id)
    create :instrument
    @suggestion = create(:suggestion, practice_session_id: practice_session.id)
  end

  it 'should have a method to access available songs' do
    expect(@suggestion.songs.map(&:id)).to eq @repertoire.songs.map(&:id)
  end

  it 'should select a song title at random' do
    song_titles = @suggestion.songs.map(&:title)

    expect(song_titles).to include(@suggestion.select_song_title)
  end

  it 'should select an instrument name at random' do
    3.times do
      create :instrument, selected: true
      create :instrument, selected: false
    end
    selected_instrument_names = Instrument.where(selected: true).map(&:name)

    expect(
      selected_instrument_names
    ).to include(@suggestion.select_instrument_name)
  end

  it 'should set song_title and instrument_name before save' do
    expect(@suggestion.song_title).to be_an_instance_of String
    expect(@suggestion.instrument_name).to be_an_instance_of String
  end
end
