require 'rails_helper'

describe 'Suggestions' do
  it 'should display a random song' do
    repertoire = create :repertoire
    5.times { repertoire.songs << create(:song) }

    visit repertoire_path repertoire
    click_on 'Practice'

    titles = repertoire.songs.map(&:title)
    expect(titles).to include(page.find('.song-title').text)
  end
end
