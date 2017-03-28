class SongsController < ApplicationController
  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.create(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @artist = @song.artist
    @song.update_attributes(song_params)
    if @song.save
      redirect_to @song
    else
      redirect_to new_artist_song_path(@artist)
    end
  end

  private

    def song_params
      params.require(:song).permit(:title)
    end
end
