class TracksController < ApplicationController

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def new
    @track = Track.new
    @track.band_id = params[:band_id]
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      flash[:message] = "#{@track.name} created!"
      redirect_to track_url(@track)
    else
      flash.now[:message] = "Please fill in all fields"
      render :new
    end
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      flash[:message] = "#{@track.name} updated!"
      redirect_to track_url(@track)
    else
      flash.now[:message] = "Please fill in all fields"
      render :new
    end
  end

  def destroy
    @track = Track.find(params[:id])
    album = @track.album_id
    flash[:message] = "#{@track.name} deleted!"
    @track.delete
    redirect_to album_url(album)
  end

  private
  def track_params
    params.require(:track).permit(:name, :album_id, :track_type, :lyrics)
  end
end
