require 'sequel'
require 'logger'
DB = Sequel.connect('postgres://localhost/sequel_example')
DB.logger = Logger.new($stdout)

require_relative './models/article'
require_relative './models/comment'

Comment.eager(:article).all { |c| puts c.article }
Comment.eager_graph(:article).all { |c| puts c.article }
Comment.all { |c| puts c.article }
