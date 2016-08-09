class SongsController < ApplicationController
  before_action :repertoire

  def new
    @song = Song.new
  end

  def create
    @song = @repertoire.songs.build(song_params)
    if @song.save
      redirect_to @repertoire, notice: 'Song Added'
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :key, :quality, :comfort)
  end

  def repertoire
    @repertoire = Repertoire.find(params[:repertoire_id])
  end
end
