# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do 
	user = User.create! :email => Faker::Internet.email, :password => 'topsecret', :password_confirmation => 'topsecret'
	5.times do
		book = Book.new(title: Faker::Book.title, author: Faker::Book.author)
		book.epub = File.new("test/fixtures/files/book.epub")
		book.genres << Genre.find_or_create_by(name: Faker::Book.genre)
		book.genres << Genre.find_or_create_by(name: Faker::Book.genre)
		book.user = user
		book.save
	end 
end