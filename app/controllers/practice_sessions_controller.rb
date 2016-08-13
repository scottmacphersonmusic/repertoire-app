class PracticeSessionsController < ApplicationController
  def create
    repertoire = Repertoire.find(params[:repertoire_id])
    @practice_session = PracticeSession.new

    if repertoire.songs.none?
      flash[:error] = "There Aren't Any Songs To Practice"
      redirect_to repertoire
    elsif @practice_session.save
      render nothing: true, status: :created
    end
  end
end
