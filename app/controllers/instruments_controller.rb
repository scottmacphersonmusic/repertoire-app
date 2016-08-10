class InstrumentsController < ApplicationController
  before_action :instrument, only: [:show, :edit, :update]

  def index
    @instruments = Instrument.all
  end

  def show
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    if @instrument.save
      redirect_to instruments_path, notice: 'Instrument Added'
    end
  end

  def edit
  end

  def update
    if @instrument.update(instrument_params)
      redirect_to @instrument, notice: 'Instrument Updated'
    end
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :key, :selected)
  end

  def instrument
    @instrument = Instrument.find(params[:id])
  end
end
