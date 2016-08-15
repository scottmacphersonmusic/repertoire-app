require 'rails_helper'

describe 'Suggestions' do
  before do
    @repertoire = create :repertoire
    @song = create :song, comfort: 1
    @repertoire.songs << @song
    @instrument = create :instrument

    visit repertoire_path @repertoire
    click_on 'Practice'
  end

  it 'should display a song' do
    expect(page.find('.suggested-song-title').text).to eq @song.title
  end

  it 'should display a key' do
    expect(page.find('.suggested-key').text).to eq @song.key
  end

  it 'should display an instrument' do
    expect(page.find('.suggested-instrument').text).to eq @instrument.name
  end

  it 'should display a "next" button to genereate next suggestion' do
    click_on 'Next'

    expect(page.find('.suggested-song-title').text).to match(/\S*/)
    expect(page.find('.suggested-key').text).to match(/\S*/)
    expect(page.find('.suggested-instrument').text).to match(/\S*/)
  end
end
