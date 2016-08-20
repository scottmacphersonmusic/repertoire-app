require 'rails_helper'

describe 'Songs' do
  before do
    @repertoire = create :repertoire
    @song_1 = create :song
    @song_2 = create :song
    @repertoire.songs << [@song_1, @song_2]
  end

  it 'should be listed under a given repertoire' do
    visit root_path
    click_on @repertoire.name

    expect(page).to have_content @song_1.title
    expect(page).to have_content @song_2.title
  end

  it 'should be created' do
    visit root_path
    click_on @repertoire.name
    click_on 'New Song'
    fill_in 'Title', with: 'Autumn Leaves'
    fill_in 'Key', with: 'G'
    fill_in 'Quality', with: 'minor'
    select '5', from: 'Comfort'
    click_on 'Add Song'

    expect(page).to have_content 'Song Added'
    expect(page).to have_content 'Autumn Leaves'
  end

  it 'should not be created without certain attributes' do
    visit repertoire_path @song_1
    click_on 'New Song'
    fill_in 'Title', with: ''
    fill_in 'Key', with: ''
    click_on 'Add Song'

    expect(page).to have_content 'Error Creating Song'
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Key can't be blank"
  end

  it 'should be updated' do
    original_title = @song_1.title

    visit root_path
    click_on @repertoire.name
    click_on @song_1.title
    click_on 'Edit'
    fill_in 'Title', with: 'Solar'
    select '0', from: 'Comfort'
    click_on 'Update Song'

    expect(page).to have_content 'Solar'
    expect(page).to have_content '0'
    expect(page).to_not have_content original_title
  end

  it 'should update multiple songs selected status' do
    visit repertoire_path @repertoire
    find("input#songs_#{@song_1.id}_selected").set(false)
    find("input#songs_#{@song_2.id}_selected").set(false)
    click_on 'Update Selected Songs'

    expect(page).to have_content 'Selected Songs Updated'
    expect(page).to have_content '0 of 2 selected'
    expect(find("input#songs_#{@song_1.id}_selected")[:checked]).to eq false
    expect(find("input#songs_#{@song_2.id}_selected")[:checked]).to eq false
  end

  it 'should not be created without certain attributes' do
    visit repertoire_path @song_1
    click_on @song_1.title
    click_on 'Edit'
    fill_in 'Title', with: ''
    fill_in 'Key', with: ''
    click_on 'Update Song'

    expect(page).to have_content 'Error Updating Song'
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Key can't be blank"
  end

  it 'should be deleted' do
    visit root_path
    click_on @repertoire.name
    click_on @song_1.title
    click_on 'Delete'

    expect(page).to have_content 'Song Deleted'
    expect(page).to_not have_content @song_1.title
  end
end
