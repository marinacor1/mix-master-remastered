class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def new
  end

  def create
    @artist = Artist.create(artist_params)
    redirect_to @artist
  end

  def show
    @artist = Artist.find(params[:id])
  end

  private

    def artist_params
      params.require(:artist).permit(:name, :image_path)
    end
end