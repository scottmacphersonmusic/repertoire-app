require 'rails_helper'

describe 'Suggestions' do
  before do
    @repertoire = create :repertoire
    @song = create :song, comfort: 1
    @repertoire.songs << @song

    visit repertoire_path @repertoire
    click_on 'Practice'
  end

  it 'should display a song' do
    expect(page.find('.suggested-song-title').text).to match @song.title
  end

  it 'should display a key' do
    expect(page.find('.suggested-key').text).to eq @song.key
  end
end
