class PagesController < ApplicationController

	def home
		songs = Song.all

		@songs_to_be_displayed = []
		songs.each do |song|
			unless song.preview_url.nil?
				@songs_to_be_displayed << song
			end
		end
	end

	def new_item
	end

	def create
		fetched_song = begin
			spotify_id = params[:url].scan(/https?:\/\/(?:open\.)?spotify\.com\/track\/(\w*)/)[0][0]
			RSpotify::Track.find(spotify_id)
		rescue Exception => e
			puts e
			flash[:alert] = "We coudn't find a song through this URL :( - Make sure you are copying a URL's track from Spotify."
			redirect_to new_item_path
		end

		if Song.exists?(spotify_id: fetched_song.id)
			flash[:alert] = "This song is already in our database."
 		    redirect_to new_item_path
		else
			artist = create_artist(fetched_song.artists.first)
			album = create_album(fetched_song.album, artist)
			song = Song.create :name => fetched_song.name, :spotify_id => fetched_song.id, :preview_url => fetched_song.preview_url, :artist => artist, :album => album
			@current_user.songs << song
			flash[:notice] = "Thanks for feeding our music library!"
			redirect_to root_path
		end
	end

	private
	
	def create_artist(artist)
		fetched_artist = Artist.where(spotify_id: artist.id).first
		if !fetched_artist 
        	Artist.create :name => artist.name, :spotify_id => artist.id
    	else 
			fetched_artist
		end
	end

	def create_album(album, artist)
		fetched_album = Album.where(spotify_id: album.id).first
		if !fetched_album
			Album.create :name => album.name, :spotify_id => album.id, :image => album.images.first['url'], :artist => artist
		else
			fetched_album
		end
	end
end