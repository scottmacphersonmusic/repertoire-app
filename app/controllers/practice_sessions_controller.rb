class PracticeSessionsController < ApplicationController
  def create
    @practice_session = PracticeSession.new
    if @practice_session.save
      render nothing: true
    end
  end
end
