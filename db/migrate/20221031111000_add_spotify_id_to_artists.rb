class AddSpotifyIdToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :spotify_id, :text, null: false, index: { unique: true }
  end
end
