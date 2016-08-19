class Book < ApplicationRecord

	has_many :bookgenres
	has_many :books, through: :bookgenres
	has_attached_file :epub
	validates_attachment :epub, presence: true,
	  content_type: { content_type: "application/epub+zip" }
end
