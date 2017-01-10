class Album < Sequel::Model
  many_to_one :artist, key: [:artist_name, :artist_city]
end
