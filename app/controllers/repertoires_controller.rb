class RepertoiresController < ApplicationController
  def index
    @repertoires = Repertoire.all
  end
end
