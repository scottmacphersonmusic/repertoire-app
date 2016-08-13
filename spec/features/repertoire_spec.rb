require 'rails_helper'

describe 'Repertoires' do
  before do
    @repertoire = create :repertoire
  end

  it 'should be listed' do
    visit root_path

    expect(page).to have_content @repertoire.name
  end

  describe 'create' do
    it 'should be created' do
      visit root_path
      click_on 'New Repertoire'
      fill_in 'Name', with: 'Jazz Tunes'
      click_on 'Add Repertoire'

      expect(page).to have_content 'Repertoire Added'
      expect(page).to have_content 'Jazz Tunes'
    end

    it 'should not be created without a name' do
      visit repertoires_path
      click_on 'New Repertoire'
      click_on 'Add Repertoire'

      expect(page).to have_content 'Error Saving Repertoire'
      expect(page).to have_content "Name can't be blank"
    end
  end

  it 'should be updated' do
    visit root_path
    click_on @repertoire.name
    click_on 'Edit'
    fill_in 'Name', with: 'Blues Tunes'
    click_on 'Update Repertoire'

    expect(page).to have_content 'Repertoire Updated'
    expect(page).to have_content 'Blues Tunes'
  end

  it 'should be deleted' do
    visit root_path
    click_on @repertoire.name
    click_on 'Delete'

    expect(page).to have_content 'Repertoire Deleted'
    expect(page).to_not have_content @repertoire.name
  end
end
