class GenresController < ApplicationController
  before_action :set_genre, only: [:show, :edit, :update, :destroy]

  def index
    @genres = Genre.all.sort_by {|x| x.name}
  end

  def show
    @books = Book.joins(:genres).where(genres: {name: @genre.name})
  end

  def most_popular
    @genres = Genre.all.sort_by {|x| x.books.count}.reverse
    render :index
  end

  def new
    @genre = Genre.new
  end

  def edit
  end

  def create
    @genre = Genre.new(genre_params)

    respond_to do |format|
      if @genre.save
        format.html { redirect_to @genre, notice: 'Genre was successfully created.' }
       else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @genre.update(genre_params)
        format.html { redirect_to @genre, notice: 'Genre was successfully updated.' }
       else
        format.html { render :edit }
       end
    end
  end

  def destroy
    @genre.destroy
    respond_to do |format|
      format.html { redirect_to genres_url, notice: 'Genre was successfully destroyed.' }
    end
  end

  private
    def set_genre
      @genre = Genre.find(params[:id])
    end

    def genre_params
      params.require(:genre).permit(:name)
    end
end
