class AlbumsController < ApplicationController

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def new
    @album = Album.new
    @album.band_id = params[:band_id]
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:message] = "#{@album.name} created!"
      redirect_to album_url(@album)
    else
      flash.now[:message] = "Failed to create album"
      render :new
    end
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      flash[:message] = "#{@album.name} updated!"
      redirect_to album_url(@album)
    else
      flash.now[:message] = "Failed to update album"
      render :new
    end
  end

  def destroy
    @album = Album.find(params[:id])
    band = @album.band_id
    flash[:message] = "#{@album.name} deleted!"
    @album.delete
    redirect_to band_url(band)
  end

  private

  def album_params
    params.require(:album).permit(:name, :band_id, :album_type)
  end
end
