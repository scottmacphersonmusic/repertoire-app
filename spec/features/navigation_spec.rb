require 'rails_helper'

describe 'Navigation' do
  before do
    visit root_path
  end

  it 'should link to instruments in nav bar' do
    expect(find('.nav-bar')).to have_link 'Instruments'
  end

  it 'should link to repertoires in nav bar' do
    expect(find('.nav-bar')).to have_link 'Repertoires'
  end
end
