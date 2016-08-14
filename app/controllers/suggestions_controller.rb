class SuggestionsController < ApplicationController
  def show
    @suggestion = Suggestion.find(params[:id])
    @practice_session = @suggestion.practice_session
  end

  def create
    practice_session = PracticeSession.find(params[:practice_session_id])
    @suggestion = Suggestion.new(
      song_title: practice_session.songs.sample.title
    )
    if @suggestion.save
      redirect_to @suggestion
    end
  end
end
