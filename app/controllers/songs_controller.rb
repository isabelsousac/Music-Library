class SongsController < ApplicationController
    before_action :get_user
    before_action :get_song, only: [:show, :destroy]

    def index
        @songs = @user.songs
    end

    def show
    end

    def destroy
        @user.songs.delete(@song)
        redirect_to user_songs_path
    end

    private
    def get_user
        @user = User.find(params[:user_id])
    end

    def get_song
        @song = Song.find(params[:id])
    end
end
