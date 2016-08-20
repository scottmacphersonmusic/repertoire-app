require 'rails_helper'

describe Suggestion do
  before do
    @repertoire = create :repertoire
    3.times { @repertoire.songs << create(:song) }
    @practice_session = create(:practice_session, repertoire_id: @repertoire.id)
  end

  it 'should find available songs' do
    suggestion = create(:suggestion, practice_session_id: @practice_session.id)

    expect(suggestion.songs.map(&:id)).to eq @repertoire.songs.map(&:id)
  end

  it 'should find associated Song' do
    suggestion = create(:suggestion, practice_session_id: @practice_session.id)

    expect(suggestion.song).to be_an_instance_of Song
  end

  it 'should select a :selected Song at random' do
    3.times { @repertoire.songs << create(:song, selected: false) }
    suggestion = create(:suggestion, practice_session_id: @practice_session.id)

    expect(
      @repertoire.songs.where(selected: true)
    ).to include(suggestion.select_song)
  end

  it 'should select an Instrument name at random' do
    2.times do
      create :instrument, selected: true
      create :instrument, selected: false
    end
    selected_instrument_names = Instrument.where(selected: true).map(&:name)
    suggestion = create(:suggestion, practice_session_id: @practice_session.id)

    expect(
      selected_instrument_names
    ).to include(suggestion.select_instrument_name)
  end

  it 'should select key as original key if comfort is 0-3' do
    @repertoire.songs.each do |song|
      song.update_attributes comfort: 3, key: 'C'
    end
    suggestion = create(:suggestion, practice_session_id: @practice_session.id)

    expect(suggestion.select_key).to eq 'C'
  end

  # this doesn't actually test that the key could be different from the original
  it 'should set random key if comfort is 4-5' do
    @repertoire.songs.each do |song|
      song.update_attributes comfort: 4, key: 'C'
    end
    suggestion = create(:suggestion, practice_session_id: @practice_session.id)

    expect(Suggestion::KEYS).to include(suggestion.key)
  end

  it 'should set song_title, key and instrument_name before save' do
    create :instrument
    suggestion = create(:suggestion, practice_session_id: @practice_session.id)

    expect(suggestion.song_title).to be_an_instance_of String
    expect(suggestion.key).to be_an_instance_of String
    expect(suggestion.instrument_name).to be_an_instance_of String
  end
end
