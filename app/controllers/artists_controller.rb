class ArtistsController < ApplicationController
    before_action :get_user
    before_action :get_artist, only: [:show]

    def index
        @artists = @user.artists
    end

    def show
    end

    private
    def get_user
        @user = User.find(params[:user_id])
    end

    def get_artist
        @artist = Artist.find(params[:id])
    end
end