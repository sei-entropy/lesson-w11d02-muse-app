class ArtistsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :show, :index]
    before_action :find_artist, except: [:index, :new, :create]

    def index
         
        @artists = current_user.artists.all
        
    end

    def show
        # @artist = Artist.find(params[:id])
        @songs = @artist.songs

        if @artist.user != current_user
            flash[:notice] = 'Not allowed!'
            redirect_to artist_path
          end
      end


    def new
        @artist = Artist.new
      end

      

    def create
        # Artist.create(params.require(:artist).permit(:name, :albums, :hometown, :img))
        # redirect_to artists_path

        @artist = Artist.new(artist_params)
        @artist.user = current_user
    
        if @artist.save
            redirect_to @artist
          else
            render 'new'
          end
    end

    def edit
        @artist = Artist.find(params[:id])
    end

    def update
        artist = Artist.find(params[:id])
        artist.update(params.require(:artist).permit(:name, :albums, :hometown, :img))
          
        redirect_to artist
    end

    def destroy
        Artist.find(params[:id]).destroy
      
        redirect_to artists_path
      end

      
      def find_artist
        @artist = Artist.find(params[:id])
      end

      def artist_params
        params.require(:artist).permit(:name, :albums, :hometown, :img)
      end
	
end
