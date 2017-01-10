Sequel.migration do
  transaction
  change do
    create_table(:groups) do
      primary_key :id
      String :name, null: false
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
