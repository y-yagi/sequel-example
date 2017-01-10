class Artist < Sequel::Model
  unrestrict_primary_key

  one_to_many :albums, key: [:artist_name, :artist_city]
end
