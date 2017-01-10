class Item < Sequel::Model
  many_to_one :group
  unrestrict_primary_key
end
