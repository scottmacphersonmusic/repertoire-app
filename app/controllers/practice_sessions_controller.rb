class PracticeSessionsController < ApplicationController
  def create
    repertoire = Repertoire.find(params[:repertoire_id])
    @practice_session = repertoire.practice_sessions.new

    if @practice_session.save
      render nothing: true, status: :created
    else
      flash[:error] = 'Error Creating Practice Session'
      redirect_to repertoire
    end
  end
end
