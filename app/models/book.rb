class Book < ApplicationRecord

	has_many :bookgenres
	has_many :genres, through: :bookgenres

	validates :title, presence: true
	validates :author, presence: true

	has_attached_file :epub
	validates_attachment :epub, presence: true,
	  content_type: { content_type: "application/epub+zip" }
end
