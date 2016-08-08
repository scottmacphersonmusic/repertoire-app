class RepertoiresController < ApplicationController
  def index
    @repertoires = Repertoire.all
  end

  def new
    @repertoire = Repertoire.new
  end

  def create
    @repertoire = Repertoire.new(repertoire_params)
    if @repertoire.save
      flash.notice = 'Repertoire Added'
      redirect_to repertoires_path
    end
  end

  private

  def repertoire_params
    params.require(:repertoire).permit(:name)
  end
end
