class ChangePreviewUrlToNotNullInSongs < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :preview_url, :text
    add_column :songs, :preview_url, :text, null: false
  end
end
