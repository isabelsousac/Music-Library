class SongsController < ApplicationController
    before_action :get_song, only: [:show, :destroy, :like]

    def index
        @songs = @current_user.songs
    end

    def show
    end

    def destroy
        @current_user.songs.delete(@song)
        redirect_to songs_path
    end

    def dislike
        redirect_to root_path
    end

    def like
        if !@current_user.songs.exists?(spotify_id: @song.spotify_id)
            @current_user.songs << @song
        end
        redirect_to root_path
    end

    def library_songs
        @songs = Song.all
    end

    private
   
    def get_song
        @song = Song.find(params[:id])
    end

end
