class Book < ApplicationRecord

	belongs_to :user

	has_many :bookgenres
	has_many :genres, through: :bookgenres
	accepts_nested_attributes_for :genres

	validates :title, presence: true
	validates :author, presence: true

	has_attached_file :epub
	validates_attachment :epub, presence: true,
	  content_type: { content_type: "application/epub+zip" }


	def genres_attributes=(genre_attributes)
	  genre_attributes.values.each do |genre_attribute|
	    genre = Genre.find_or_create_by(genre_attribute)
	    self.genres << genre
	  end
	end
end
