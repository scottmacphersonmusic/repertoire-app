require 'rails_helper'

describe 'Repertoires' do
  it 'lists all repertoires' do
    Repertoire.create!(name: 'Jazz Tunes')

    visit root_path

    expect(page).to have_content 'Jazz Tunes'
  end

  it 'adds a new repertoire' do
    visit root_path
    click_on 'New Repertoire'
    fill_in 'Name', with: 'Jazz Tunes'
    click_on 'Add Repertoire'

    expect(page).to have_content 'Repertoire Added'
    expect(page).to have_content 'Jazz Tunes'
  end
end
