require 'rails_helper'

describe 'Repertoires' do
  it 'list all repertoires' do
    Repertoire.create!(name: 'Jazz Tunes')

    visit root_path

    expect(page).to have_content 'Jazz Tunes'
  end

  it 'add a new repertoire' do
    visit root_path
    click_on 'New Repertoire'
    fill_in 'Name', with: 'Jazz Tunes'
    click_on 'Add Repertoire'

    expect(page).to have_content 'Repertoire Added'
    expect(page).to have_content 'Jazz Tunes'
  end

  it 'edit a repertoire' do
    Repertoire.create!(name: 'Jazz Tunes')

    visit root_path
    click_on 'Jazz Tunes'
    click_on 'Edit'
    fill_in 'Name', with: 'Blues Tunes'
    click_on 'Update Repertoire'

    expect(page).to have_content 'Repertoire Updated'
    expect(page).to have_content 'Blues Tunes'
  end
end
