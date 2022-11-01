class AddSpotifyIdToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :spotify_id, :text, null: false, index: { unique: true }
  end
end
