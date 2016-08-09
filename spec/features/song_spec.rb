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

  it 'add new song' do
    visit root_path
    click_on 'Jazz Tunes'
    click_on 'New Song'
    fill_in 'Title', with: 'Autumn Leaves'
    fill_in 'Key', with: 'G'
    fill_in 'Quality', with: 'minor'
    select '5', from: 'Comfort'
    click_on 'Add Song'

    expect(page).to have_content 'Song Added'
    expect(page).to have_content 'Autumn Leaves'
  end

  it 'edit song' do
    visit root_path
    click_on 'Jazz Tunes'
    click_on 'Solar'
    click_on 'Edit'
    fill_in 'Title', with: 'Lunar'
    select '0', from: 'Comfort'
    click_on 'Update Song'

    expect(page).to have_content 'Lunar'
    expect(page).to have_content '0'
  end

  it 'delete song' do
    visit root_path
    click_on 'Jazz Tunes'
    click_on 'Solar'
    click_on 'Delete'

    expect(page).to have_content 'Song Deleted'
    expect(page).to_not have_content 'Solar'
  end
end
