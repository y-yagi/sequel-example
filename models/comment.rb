class Comment < Sequel::Model
  many_to_one :article
  plugin :validation_helpers

  def validate
    super
    validates_presence [:article_id, :commenter, :body]
  end
end
