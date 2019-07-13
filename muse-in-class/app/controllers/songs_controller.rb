class SongsController < ApplicationController
  def new
    @artist = Artist.find(params[:artist_id])
    @song = Song.new
  end

  def create
    puts params
    artist = Artist.find(params[:song][:artist_id])
    Song.create(params.require(:song).permit(:title, :length, :genre, :artist_id))
          
    redirect_to artist
  end
end
