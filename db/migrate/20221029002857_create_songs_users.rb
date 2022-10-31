class CreateSongsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :songs_users do |t|
      t.integer :song_id
      t.integer :user_id
    end
  end
end
