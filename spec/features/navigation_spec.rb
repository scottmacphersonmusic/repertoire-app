require 'rails_helper'

describe 'Navigation' do
  before do
    visit root_path
  end

  it 'links to instruments in nav bar' do
    expect(find('.nav-bar')).to have_link 'Instruments'
  end

  it 'links to repertoires in nav bar' do
    expect(find('.nav-bar')).to have_link 'Repertoires'
  end
end
