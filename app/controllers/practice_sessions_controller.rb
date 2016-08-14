class PracticeSessionsController < ApplicationController
  def create
    @repertoire = Repertoire.find(params[:repertoire_id])
    @practice_session = @repertoire.practice_sessions.new

    if @practice_session.save
      # render nothing: true, status: :created
      # suggestion = Suggestion.create!(
      #   song_title: @practice_session.songs.sample.title,
      # )
      suggestion = @practice_session.suggestions.create!(
        song_title: @practice_session.songs.sample.title
      )
      redirect_to suggestion
    else
      flash[:error] = 'Error Creating Practice Session'
      redirect_to @repertoire
    end
  end
end
