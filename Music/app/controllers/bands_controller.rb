class BandsController < ApplicationController
  before_action :require_login!

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
    @band = Band.new
    render :new
  end

  def destroy
    @band = Band.find(params[:id])
    flash[:message] = "#{@band_name.name} deleted!"
    @band.delete
    redirect_to bands_url
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      flash[:message] = "#{@band.name} updated!"
      redirect_to band_url(@band)
    else
      flash.now[:message] = "Update failed"
      render :edit
    end
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
