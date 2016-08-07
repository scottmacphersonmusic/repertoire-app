require 'rails_helper'

describe 'welcome page' do
  it 'displays the title' do
    visit root_path

    expect(page).to have_content 'Welcome to the Repertoire App!'
  end
end
