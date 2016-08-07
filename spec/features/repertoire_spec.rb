require 'rails_helper'

describe 'repertoires' do
  it 'lists all repertoires' do
    Repertoire.create! name: 'Jazz Tunes'

    visit root_path

    expect(page).to have_content 'Jazz Tunes'
  end
end
