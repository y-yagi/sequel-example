Sequel.migration do
  transaction
  change do
    create_table(:comments) do
      primary_key :id
      foreign_key(:article_id, :articles)
      String :commenter, null: false
      Text :body, null: false
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
