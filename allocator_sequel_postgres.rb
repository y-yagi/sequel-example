require "sequel"
require "pg"
require "allocation_tracer"
require "pp"

sequel_db = "sequel_example"

system("dropdb #{sequel_db}")
system("createdb #{sequel_db}")

DB = Sequel.connect("postgres://localhost/#{sequel_db}")

DB.create_table :posts do
  primary_key :id
  String :name
end

DB.create_table :comments do
  primary_key :id
  Integer :post_id
end

class SequelPost < Sequel::Model(:posts)
  one_to_many :comments
end

class SequelComment < Sequel::Model(:comments)
  many_to_one :post
end

100.times { |i| SequelPost.create(name: "dummy#{i}") }

ObjectSpace::AllocationTracer.trace { SequelPost.all.each{} }
p allocated: ObjectSpace::AllocationTracer.allocated_count_table
