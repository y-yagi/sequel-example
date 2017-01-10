require 'sequel'
require 'logger'
DB = Sequel.connect('postgres://localhost/sequel_example',
                    servers: { slave: { host: 'localhost', database: 'sequel_example_slave' } })
DB.logger = Logger.new($stdout)

require_relative './models/article'
require_relative './models/comment'

# default serverからデータ取得
puts Article.server(:default).count

# slaveからデータ取得
puts Article.server(:slave).count

# default serverからデータ取得
puts Article.count
