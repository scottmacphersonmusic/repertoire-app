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

    Instrument.create!(name: 'Flute', key: 'C')
    Instrument.create!(name: 'Piano', key: 'C')
    Instrument.create!(name: 'Trumpet', key: 'Bb', selected: false)

    visit root_path
    click_on 'Jazz Tunes'
    click_on 'Practice'
  end

  it 'picks a song at random' do
    titles = @repertoire.songs.map(&:title)
    expect(titles).to include(page.find('.song-title').text)
  end

  it 'picks a selected instrument at random' do
    selected_instruments = Instrument.where(selected: true).map(&:name)
    expect(selected_instruments).to include(page.find('.instrument').text)
  end
end
