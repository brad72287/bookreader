module GenresHelper
  def genre_links(book)
  	book.genres.map {|genre| link_to genre.name, genre_path(genre)}.join(", ").html_safe
  end
end
