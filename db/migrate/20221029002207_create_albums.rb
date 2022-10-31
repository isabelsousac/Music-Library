class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.text :name
      t.integer :artist_id
      t.text :info
      t.text :image
      t.integer :released_year

      t.timestamps
    end
  end
end
