class Book < ApplicationRecord

	has_attached_file :epub
	validates_attachment :epub, presence: true,
	  content_type: { content_type: "application/epub+zip" }
end
