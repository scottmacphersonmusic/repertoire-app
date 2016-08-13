require 'rails_helper'

describe PracticeSessionsController do
  before do
    @repertoire = create :repertoire
  end

  describe 'POST create' do
    it 'should create a new practice session' do
      @repertoire.songs << create(:song)

      post :create, { repertoire_id: @repertoire.id }

      expect(response).to have_http_status :created
      expect(PracticeSession.count).to eq 1
    end

    it 'should not be created if there are no songs to practice' do
      post :create, { repertoire_id: @repertoire.id }

      expect(@repertoire.songs.count).to eq 0
      expect(PracticeSession.count).to eq 0
      expect(response).to redirect_to @repertoire
    end
  end
end
