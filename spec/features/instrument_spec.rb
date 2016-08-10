require 'rails_helper'

describe 'Instrument' do
  before do
    Instrument.create!(name: 'Alto Saxophone')
    Instrument.create!(name: 'Tenor Saxophone')
    Instrument.create!(name: 'Clarinet')
    Instrument.create!(name: 'Flute')
    Instrument.create!(name: 'Piano')
  end

  it 'lists all instruments' do
    visit root_path
    click_on 'Instruments'

    expect(page).to have_content 'Alto Saxophone'
    expect(page).to have_content 'Tenor Saxophone'
    expect(page).to have_content 'Clarinet'
    expect(page).to have_content 'Flute'
    expect(page).to have_content 'Piano'
  end

  it 'add an instrument' do
    visit instruments_path
    click_on 'New Instrument'
    fill_in 'Name', with: 'Trumpet'
    fill_in 'Key', with: 'Bb'
    click_on 'Add Instrument'

    expect(page).to have_content 'Instrument Added'
    expect(page).to have_content 'Trumpet'
  end

  it 'edit an instrument' do
    visit instruments_path
    click_on 'Piano'
    click_on 'Edit'
    fill_in 'Name', with: 'Keyboard'
    click_on 'Update Instrument'

    expect(page).to have_content 'Instrument Updated'
    expect(page).to have_content 'Keyboard'
  end

  it 'delete an instrument' do
    visit instruments_path
    click_on 'Flute'
    click_on 'Delete'

    expect(page).to have_content 'Instrument Deleted'
    expect(page).to_not have_content 'Flute'
  end
end
