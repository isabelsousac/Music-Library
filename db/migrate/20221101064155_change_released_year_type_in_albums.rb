class ChangeReleasedYearTypeInAlbums < ActiveRecord::Migration[5.2]
  def change
    remove_column :albums, :released_year, :integer
    add_column :albums, :released_year, :date
  end
end
