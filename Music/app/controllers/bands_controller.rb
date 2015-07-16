class BandsController < ApplicationController
  def create
    @band = Band.new(band_params)
    if @band.save
      flash.now[:message] = "Band '#{@band.name}' created!"
      redirect_to bands_url
    else
      flash.now[:message] = "Band name cannot be empty"
      render :new
    end
  end

  def new
    render :new
  end

  def destroy
  end

  def show
    @band = Band.find(params[:id])
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
