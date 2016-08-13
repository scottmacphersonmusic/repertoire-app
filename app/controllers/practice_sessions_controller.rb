class PracticeSessionsController < ApplicationController
  def create
    @practice_session = PracticeSession.new(practice_session_params)
    if @practice_session.save
      render nothing: true
    end
  end

  private

  def practice_session_params
    params.require(:practice_session).permit(:repertoire_id)
  end
end
