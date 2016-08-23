class Genre < ApplicationRecord
	has_many :bookgenres
	has_many :books, through: :bookgenres

	validates :name, presence: true

	def self.most_popular
		all.sort_by {|x| x.books.count}.reverse
	end

	def self.alphabetized
		all.sort_by {|x| x.name}
	end
end
