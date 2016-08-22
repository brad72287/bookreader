module GenresHelper
  def genre_links(book)
  	book.genres.map {|x| link_to x.name, root_path}.join(", ").html_safe
  end
end
