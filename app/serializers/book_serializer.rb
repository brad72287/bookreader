class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :genres, :user_id

  has_many :genres

end
