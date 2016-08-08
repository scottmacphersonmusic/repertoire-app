class RepertoiresController < ApplicationController
  before_action :repertoire, only: [:show, :edit, :update, :destroy]

  def index
    @repertoires = Repertoire.all
  end

  def show
    @songs = @repertoire.songs
  end

  def new
    @repertoire = Repertoire.new
  end

  def create
    @repertoire = Repertoire.new(repertoire_params)
    if @repertoire.save
      redirect_to repertoires_path, notice: 'Repertoire Added'
    end
  end

  def edit
  end

  def update
    if @repertoire.update(repertoire_params)
      redirect_to @repertoire, notice: 'Repertoire Updated'
    end
  end

  def destroy
    @repertoire.destroy
    redirect_to root_path, notice: 'Repertoire Deleted'
  end

  private

  def repertoire_params
    params.require(:repertoire).permit(:name)
  end

  def repertoire
    @repertoire = Repertoire.find(params[:id])
  end
end
