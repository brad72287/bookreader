class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :book_id, :user_id
  has_one :user
end
