require 'rails_helper'

describe 'practice' do
  before do
    @repertoire = Repertoire.create!(name: 'Jazz Tunes')
    @repertoire.songs.create!(
      title: 'Oleo',
      key: 'Bb',
      quality: 'major',
      comfort: 5
    )
    @repertoire.songs.create!(
      title: 'Solar',
      key: 'C',
      quality: 'minor',
      comfort: 4
    )
    @repertoire.songs.create!(
      title: 'Giant Steps',
      key: 'B',
      quality: 'major',
      comfort: 3
    )
  end

  it 'picks a song at random' do
    visit root_path
    click_on 'Jazz Tunes'
    click_on 'Practice'

    titles = @repertoire.songs.map(&:title)
    expect(titles).to include(page.find('.song-title').text)
  end
end
