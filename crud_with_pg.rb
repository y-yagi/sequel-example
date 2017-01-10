require 'sequel'
require 'logger'
DB = Sequel.connect('postgres://localhost/sequel_example')
DB.logger = Logger.new($stdout)

require_relative './models/article'
require_relative './models/comment'

Article.create(title: 'Happy New Year!', text: '新年のご挨拶的なやつ')
Article.new(title: 'Happy New Year!', text: '新年のご挨拶的なやつ').save
Article.insert(title: 'Happy New Year!', text: '新年のご挨拶的なやつ')

Article.each do |article|
  puts "#{article.title}: #{article.text}(#{article.created_at})"
end

puts Article.where('id = ?', Article.last.id).to_a
Article[Article.last.id].update(title: "update title")
# Article.with_pk!(1)

Article.where('id = ?', Article.last.id).update(title: '正月休みは終わってしまったのだ…')

Article.exclude(active: true).delete
Article.dataset.delete
