require 'rails_helper'

describe 'Songs' do
  before do
    repertoire = Repertoire.create!(name: 'Jazz Tunes')
    repertoire.songs.create!(
      title: 'Oleo',
      key: 'Bb',
      quality: 'major',
      comfort: 5
    )
    repertoire.songs.create!(
      title: 'Solar',
      key: 'C',
      quality: 'minor',
      comfort: 3
    )
  end

  it 'listed under a given repertoire' do
    visit root_path
    click_on 'Jazz Tunes'

    expect(page).to have_content 'Oleo'
    expect(page).to have_content 'Solar'
  end
end
