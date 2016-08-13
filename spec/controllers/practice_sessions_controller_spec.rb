require 'rails_helper'

describe PracticeSessionsController do
  before do
    @repertoire = create :repertoire
  end

  describe 'POST create' do
    it 'should create a new practice session' do
      post :create, { repertoire_id: @repertoire.id }

      expect(PracticeSession.all.count).to equal 1
    end

    it 'should not be created if there are no songs to practice' do
    end
  end
end
