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

  # it 'should select a song title at random upon initialization' do

  #   song_titles = repertoire.songs.map(&:title)

  #   expect(song_titles).to include(suggestion.song_title)
  # end
end
