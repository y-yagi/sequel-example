Sequel.migration do
  transaction
  change do
    create_table(:items) do
      foreign_key(:group_id, :groups)
      Integer :position
      primary_key [:group_id, :position], name: :items_pk
    end
  end
end
