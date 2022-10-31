class AlbumsController < ApplicationController
    before_action :get_user
    before_action :get_album, only: [:show, :destroy]

    def index
        @albums = @user.albums
    end

    def show
    end

    private
    def get_user
        @user = User.find(params[:user_id])
    end

    def get_album
        @album = Album.find(params[:id])
    end
end
