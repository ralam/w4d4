class BandsController < ApplicationController
  def create
    @band = Band.new(band_params)
    if @band.save
      flash.now[:message] = "Band '#{@band.name}' created!"
      redirect_to bands_url
    else
      flash.now[:message] = "Band was not created, try again"
      render :new_band_url
    end
  end

  def new
    render :new
  end

  def destroy
  end

  def show
    render :show
  end

  def edit
  end

  def updated
  end

  def index
    @bands = Band.all
    render :index
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

end
