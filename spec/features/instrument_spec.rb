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

  it 'should be deleted' do
    visit instruments_path
    click_on @instrument.name
    click_on 'Delete'

    expect(page).to have_content 'Instrument Deleted'
    expect(page).to_not have_content @instrument.name
  end
end
