class Genre < ApplicationRecord
	has_many :bookgenres
	has_many :books, through: :bookgenres

	validates :name, presence: true
end
