class AlbumsController < ApplicationController
    before_action :get_album, only: [:show]

    def index
        @albums = @current_user.albums
    end

    def show
    end

    private

    def get_album
        @album = Album.find(params[:id])
    end
end
