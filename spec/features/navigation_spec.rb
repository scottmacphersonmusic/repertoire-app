require 'rails_helper'

describe 'Navigation' do
  it 'links to instruments in nav bar' do
    visit root_path

    expect(find('.nav-bar')).to have_link 'Instruments'
  end
end
