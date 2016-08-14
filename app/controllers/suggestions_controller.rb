class SuggestionsController < ApplicationController
  def show
    @suggestion = Suggestion.find(params[:id])
    @practice_session = @suggestion.practice_session
  end

  def create
    @suggestion = Suggestion.new(song_title: select_song_title)
    if @suggestion.save
      redirect_to @suggestion
    end
  end
end
