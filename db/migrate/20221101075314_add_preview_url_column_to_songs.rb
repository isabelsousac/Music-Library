class AddPreviewUrlColumnToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :preview_url, :text
  end
end
