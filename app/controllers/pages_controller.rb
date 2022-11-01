class PagesController < ApplicationController

	def home
	end

	def new_item
	end

	def create
		# url_playlist = params[:url].split('/')[-1]
		# playlist = RSpotify.find_by_id(url_playlist)
		url =  params[:url].split('/')[-1]
		@fetched_song = RSpotify::Track.find(url)
		raise "hell"

		if Song.exists?(name: @fetched_song.name)
			flash[:alert] = "This song is already in our database."
 		    redirect_to new_item_path
		else
			artist = create_artist
			album = create_album(artist)
			@song = Song.create :name => @fetched_song.name, :artist => artist, :album => album
		end
	end


	private
	
	def create_artist
		artist_name = @fetched_song.artists.first.name
		if Artist.exists?(name: artist_name)
			Artist.where(name: artist_name).first
		else
			Artist.create :name => artist_name
		end
	end

	def create_album(artist)
		song_album = @fetched_song.album
	
		if Album.exists?(name: song_album.name)
			Album.where(name: song_album.name)
		else
			album_image = song_album.images[1]
			album_date = song_album.release_date
			Album.create :name => song_album.name, :image => song_album.image, :released_year => song_album.date, :artist => artist
		end
	end
end