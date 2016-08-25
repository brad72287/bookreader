class Comment < ApplicationRecord
	belongs_to :book
	belongs_to :user

	validates :content, presence: true, length: { minimum: 10 }
	validates :user_id, presence: true
	validates :book_id, presence: true
end
