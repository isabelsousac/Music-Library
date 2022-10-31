class PagesController < ApplicationController

    def home
    end

    def new_item
    end

    def create
        spotify_artist = RSpotify::Artist.find(params[:id])
        artist = Artist.new
        artist.name = spotify_artist.name



        # user = User.find_by :email => params[:email]
        # if user.present? && user.authenticate(params[:password])
        #     session[:user_id] = user.id
        #     redirect_to root_path
        # else
        #     flash[:alert] = "User not found. Check your email or password."
        #     redirect_to login_path
        # end
    end
end