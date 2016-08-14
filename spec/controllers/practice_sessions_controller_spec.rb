require 'rails_helper'

describe PracticeSessionsController do
  before do
    @repertoire = create :repertoire
  end

  describe 'POST create' do
    it 'should create a new practice session' do
      @repertoire.songs << create(:song)

      post :create, { repertoire_id: @repertoire.id }

      # expect(response).to have_http_status :created
      expect(PracticeSession.count).to eq 1
    end

    it 'should not be created if there are no songs to practice' do
      expect(@repertoire.songs.count).to eq 0

      post :create, { repertoire_id: @repertoire.id }

      expect(PracticeSession.count).to eq 0
      expect(response).to redirect_to repertoire_path @repertoire
      expect(flash[:error]).to match 'Error Creating Practice Session'
    end
  end
end
