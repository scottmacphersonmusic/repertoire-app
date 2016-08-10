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
end
