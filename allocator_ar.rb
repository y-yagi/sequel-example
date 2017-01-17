require "active_record"
require "pg"
require "allocation_tracer"
require "pp"

ar_db = "ar.db"

File.delete(ar_db) rescue nil

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ar_db)
ActiveRecord::Schema.define do
  create_table :posts, force: true do |t|
    t.string :name
  end

  create_table :comments, force: true do |t|
    t.integer :post_id
  end
end

class ArPost < ActiveRecord::Base
  self.table_name = "posts"
  has_many :comments
end

class ArComment < ActiveRecord::Base
  self.table_name = "comments"
  belongs_to :post
end

100.times { |i| ArPost.create(name: "dummy#{i}") }

ObjectSpace::AllocationTracer.trace { ArPost.all.each{} }
p allocated: ObjectSpace::AllocationTracer.allocated_count_table
