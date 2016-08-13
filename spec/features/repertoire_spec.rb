require 'rails_helper'

describe 'Repertoires' do
  it 'should be listed' do
    repertoire = create :repertoire

    visit root_path

    expect(page).to have_content repertoire.name
  end

  it 'should be created' do
    visit root_path
    click_on 'New Repertoire'
    fill_in 'Name', with: 'Jazz Tunes'
    click_on 'Add Repertoire'

    expect(page).to have_content 'Repertoire Added'
    expect(page).to have_content 'Jazz Tunes'
  end

  it 'should be updated' do
    repertoire = create :repertoire

    visit root_path
    click_on repertoire.name
    click_on 'Edit'
    fill_in 'Name', with: 'Blues Tunes'
    click_on 'Update Repertoire'

    expect(page).to have_content 'Repertoire Updated'
    expect(page).to have_content 'Blues Tunes'
  end

  it 'should be deleted' do
    repertoire = create :repertoire

    visit root_path
    click_on repertoire.name
    click_on 'Delete'

    expect(page).to have_content 'Repertoire Deleted'
    expect(page).to_not have_content repertoire.name
  end
end
