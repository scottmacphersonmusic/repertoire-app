class SongsController < ApplicationController
  before_action :repertoire
  before_action :song, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = @repertoire.songs.build(song_params)
    if @song.save
      redirect_to @repertoire, notice: 'Song Added'
    else
      flash[:error] = 'Error Creating Song'
      render :new
    end
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to repertoire_song_path(@repertoire, @song)
    else
      flash[:error] = 'Error Updating Song'
      render :edit
    end
  end

  def update_songs
    Song.transaction do
      params[:songs].each do |song_id, attributes|
        song = Song.find(song_id)
        song.update_attributes(attributes.permit(:selected))
      end
      redirect_to @repertoire, notice: 'Selected Songs Updated'
    end
  end

  def destroy
    @song.destroy
    redirect_to @repertoire, notice: 'Song Deleted'
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
