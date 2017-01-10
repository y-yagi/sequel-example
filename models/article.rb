class Article < Sequel::Model
  plugin :timestamps
  plugin :validation_helpers
  one_to_many :comments

  def validate
    super
    validates_presence [:title, :text]
  end

  def before_create
    puts "before_create"
  end
end
