require 'rails_helper'

describe 'Repertoires' do
  it 'list all repertoires' do
    repertoire = create :repertoire

    visit root_path

    expect(page).to have_content repertoire.name
  end

  it 'add a repertoire' do
    visit root_path
    click_on 'New Repertoire'
    fill_in 'Name', with: 'Jazz Tunes'
    click_on 'Add Repertoire'

    expect(page).to have_content 'Repertoire Added'
    expect(page).to have_content 'Jazz Tunes'
  end

  it 'edit a repertoire' do
    repertoire = create :repertoire

    visit root_path
    click_on repertoire.name
    click_on 'Edit'
    fill_in 'Name', with: 'Blues Tunes'
    click_on 'Update Repertoire'

    expect(page).to have_content 'Repertoire Updated'
    expect(page).to have_content 'Blues Tunes'
  end

  it 'delete a repertoire' do
    repertoire = create :repertoire

    visit root_path
    click_on repertoire.name
    click_on 'Delete'

    expect(page).to have_content 'Repertoire Deleted'
    expect(page).to_not have_content repertoire.name
  end
end
