Sequel.migration do
  transaction
  change do
    create_table(:artists) do
      String :name
      String :city
      primary_key [:name, :city]
    end
  end
end
