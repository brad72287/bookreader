class Bookgenre < ApplicationRecord
	belongs_to :book 
	belongs_to :genre
end
