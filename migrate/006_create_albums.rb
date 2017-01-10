Sequel.migration do
  transaction
  change do
    create_table(:albums) do
      primary_key :id
      String :name
      String :artist_name
      String :artist_city
      Date :release
    end
  end
end
