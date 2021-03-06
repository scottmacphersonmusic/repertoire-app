class PracticeSessionsController < ApplicationController
  def create
    repertoire = Repertoire.find(params[:repertoire_id])
    @practice_session = repertoire.practice_sessions.new

    if @practice_session.save
      Suggestion.transaction do
        suggestion = @practice_session.suggestions.create!
        redirect_to suggestion, status: :moved_permanently
      end
    else
      flash[:error] = 'Error Creating Practice Session'
      redirect_to repertoire, status: :moved_permanently
    end
  end
end
