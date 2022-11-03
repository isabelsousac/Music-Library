class ArtistsController < ApplicationController
    before_action :get_artist, only: [:show]

    def index
        @artists = @current_user.artists
    end

    def show
    end

    private

    def get_artist
        @artist = Artist.find(params[:id])
    end
end