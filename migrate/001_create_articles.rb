Sequel.migration do
  transaction
  change do
    create_table(:articles) do
      primary_key :id
      String :title, null: false
      String :text, null: false
      Bool :active, default: false
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
