class SongsController < ApplicationController
  before_action :repertoire
  before_action :song, only: [:show, :edit]

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = @repertoire.songs.build(song_params)
    if @song.save
      redirect_to @repertoire, notice: 'Song Added'
    end
  end

  def edit
  end

  def update
    @song = @repertoire.songs.build(song_params)
    if @song.save
      redirect_to repertoire_song_path(@repertoire, @song)
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :key, :quality, :comfort)
  end

  def repertoire
    @repertoire = Repertoire.find(params[:repertoire_id])
  end

  def song
    @song = Song.find(params[:id])
  end
end
