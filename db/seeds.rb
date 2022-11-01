# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
ana = User.create :name => 'ana', :email => 'ana@ga.co', :password => 'blabla'
maria = User.create :name => 'maria', :email => 'maria@ga.co', :password => 'blabla'
puts "#{User.count} users"

Artist.destroy_all
twenty_one_pilots = Artist.create :name => 'Twenty One Pilots', :info => 'American musical duo', :spotify_id => '3YQKmKGau1PzlVlkL1iodx'
the_wombats = Artist.create :name => 'The Wombats', :info => 'English indie rock band', :spotify_id => ''
the_kooks = Artist.create :name => 'The Kooks', :info => 'English pop-rock band', :spotify_id => ''
i_prevail = Artist.create :name => 'I Prevail', :info => 'American rock band', :spotify_id => ''
puts "#{Artist.count} artists"

Album.destroy_all
beautiful_people = Album.create :name => 'Beautiful People Will Ruin Your Life', :info => 'Fourth major album by The Wombats', :released_year => 2018, :artist => the_wombats
listen = Album.create :name => 'Listen', :info => 'Fourth major album by The Kooks', :released_year => 2014, :artist => the_kooks
vessel = Album.create :name => 'Vessel', :info => 'Third studio album by Twenty One Pilots', :released_year => 2013, :artist => twenty_one_pilots
trauma = Album.create :name => 'TRAUMA', :info => 'Second studio album by I Prevail', :released_year => 2019, :artist => i_prevail
puts "#{Album.count} albums"

Song.destroy_all
cheetah_tongue = Song.create :name => 'Cheetah Tongue', :artist => the_wombats, :album => beautiful_people
sunrise = Song.create :name => 'Sunrise', :artist => the_kooks, :album => listen
run_and_go = Song.create :name => 'The Run and Go', :artist => twenty_one_pilots, :album => vessel
deadweight = Song.create :name => 'Deadweight', :artist => i_prevail, :album => trauma
puts "#{Song.count} songs"

ana.songs << cheetah_tongue << sunrise
maria.songs << cheetah_tongue << deadweight << run_and_go
