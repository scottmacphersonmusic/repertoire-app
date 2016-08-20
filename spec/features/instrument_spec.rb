 require 'rails_helper'

describe 'Instruments' do
  before do
    @instrument = create :instrument
  end

  it 'should be listed' do
    instrument_2 = create :instrument

    visit root_path
    click_on 'Instruments'

    expect(page).to have_content @instrument.name
    expect(page).to have_content instrument_2.name
  end

  it 'should be created' do
    visit instruments_path
    click_on 'New Instrument'
    fill_in 'Name', with: 'Trumpet'
    fill_in 'Key', with: 'Bb'
    click_on 'Add Instrument'

    expect(page).to have_content 'Instrument Added'
    expect(page).to have_content 'Trumpet'
  end

  it 'should not be created without name and key' do
    visit new_instrument_path
    fill_in 'Name', with: ''
    fill_in 'Key', with: ''
    click_on 'Add Instrument'

    expect(page).to have_content 'Error Adding Instrument'
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Key can't be blank"
  end

  it 'should be updated' do
    original_name = @instrument.name

    visit instruments_path
    click_on @instrument.name
    click_on 'Edit'
    fill_in 'Name', with: 'Keyboard'
    click_on 'Update Instrument'

    expect(page).to have_content 'Instrument Updated'
    expect(page).to have_content 'Keyboard'
    expect(page).to_not have_content original_name
  end

  it 'should not be updated without name and key' do
    visit edit_instrument_path @instrument
    fill_in 'Name', with: ''
    fill_in 'Key', with: ''
    click_on 'Update Instrument'

    expect(page).to have_content 'Error Updating Instrument'
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Key can't be blank"
  end

  it 'should be deleted' do
    visit instruments_path
    click_on @instrument.name
    click_on 'Delete'

    expect(page).to have_content 'Instrument Deleted'
    expect(page).to_not have_content @instrument.name
  end

  it 'should be mass updatable' do
    instrument_2 = create :instrument, selected: true

    visit instruments_path
    instrument_input_1 = find "input#instruments_#{@instrument.id}_selected"
    instrument_input_2 = find "input#instruments_#{instrument_2.id}_selected"

    instrument_input_1.set false
    instrument_input_2.set false
    click_on 'Update Selected Instruments'

    expect(page).to have_content 'Selected Instruments Updated'
    expect(instrument_input_1[:checked]).to eq false
    expect(instrument_input_2[:checked]).to eq false
  end
end
