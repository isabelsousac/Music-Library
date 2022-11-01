class AddSpotifyIdToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :spotify_id, :text, null: false, index: { unique: true }
  end
end
