class Book < ApplicationRecord

	belongs_to :user

	has_many :bookgenres
	has_many :genres, through: :bookgenres
	accepts_nested_attributes_for :genres

	has_many :comments

	validates :title, presence: true
	validates :author, presence: true

	has_attached_file :epub
	validates_attachment :epub, presence: true,
	  content_type: { content_type: "application/epub+zip" }


	def genres_attributes=(genre_attributes)
	  genre_attributes.values.each do |genre_attribute|
	  	unless genre_attribute['name'].empty?
	    	genre = Genre.find_or_create_by(genre_attribute)
	    	self.genres << genre
	    end
	  end
	end

	def download_link
		epub.url.split('?').first #using paperclip defaults results in downloading a .zip file
	end 

	def self.by_genre(genre)
		joins(:genres).where(genres: {name: genre})
	end
end
