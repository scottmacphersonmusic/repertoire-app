class InstrumentsController < ApplicationController
  before_action :instrument, only: [:show, :edit, :update, :destroy]

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
    else
      flash[:error] = 'Error Adding Instrument'
      render :new
    end
  end

  def edit
  end

  def update
    if @instrument.update(instrument_params)
      redirect_to @instrument, notice: 'Instrument Updated'
    else
      flash[:error] = 'Error Updating Instrument'
      render :edit
    end
  end

  def update_instruments
    Instrument.transaction do
      params[:instruments].each do |id, attributes|
        instrument = Instrument.find id
        instrument.update_attributes attributes.permit(:selected)
      end
      redirect_to instruments_path, notice: 'Selected Instruments Updated'
    end
  end

  def destroy
    @instrument.destroy
    redirect_to instruments_path, notice: 'Instrument Deleted'
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :key, :selected)
  end

  def instrument
    @instrument = Instrument.find(params[:id])
  end
end
