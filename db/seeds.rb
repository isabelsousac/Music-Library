playlist_tracks = RSpotify::Playlist.find_by_id('37i9dQZF1DX5Vy6DFOcx00').tracks

artists = []
albums = []
songs = []

playlist_tracks.each do |track|
    if !track.preview_url
        next
    end

    artist_name = track.artists.first.name
    artist_id = track.artists.first.id
    artists << {:name => artist_name, :id => artist_id}

    album_name = track.album.name
    album_id = track.album.id
    album_image = track.album.images.first['url']
    album_date = track.album.release_date
    albums << {:name => album_name, :id => album_id, :image => album_image, :released_year => album_date}

    track_name = track.name
    track_id = track.id
    track_preview_url = track.preview_url
    songs << {:name => track_name, :id => track_id, :preview_url => track_preview_url}
end

User.destroy_all
Song.destroy_all
Album.destroy_all
Artist.destroy_all

ana = User.create :name => 'ana', :email => 'ana@ga.co', :password => 'blabla'
maria = User.create :name => 'maria', :email => 'maria@ga.co', :password => 'blabla'

artists.each_with_index do |artist, i|
    fetched_artist = Artist.where(spotify_id: artist[:id]).first
    seed_artist = fetched_artist
    if !fetched_artist 
        seed_artist = Artist.create :name => artist[:name], :spotify_id => artist[:id]
    end

    current_album = albums[i]
    fetched_album = Album.where(spotify_id: current_album[:id]).first
    seed_album = fetched_album
    if !fetched_album
        seed_album = Album.create :name => current_album[:name], :spotify_id => current_album[:id], :image => current_album[:image], :released_year => current_album[:released_year], :artist => seed_artist
    end
    
    current_song = songs[i]
    fetched_song = Song.where(spotify_id: current_song[:id]).first
    seed_song = fetched_song
    if !fetched_song
        seed_song = Song.create :name => current_song[:name], :spotify_id => current_song[:id], :preview_url => current_song[:preview_url], :artist => seed_artist, :album => seed_album
    end
end

puts "#{Artist.count} artists"
puts "#{Album.count} albums"
puts "#{Song.count} songs"
puts "#{User.count} users"