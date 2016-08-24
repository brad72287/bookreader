class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]


  def index
    @books = current_user.books
  end

  def show
    @comment = current_user.comments.build
    @comment.book_id = @book.id
  end

  def new
    @book = current_user.books.build
  end

  def edit
  end

  def create
    #raise params.inspect
    @book = current_user.books.build(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to user_books_path(@book), notice: 'Book was successfully created.' }
       else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to user_books_url(current_user), notice: 'Book was successfully destroyed.' }
     end
  end

  def home
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author, :epub, :user_id, genre_ids: [], genres_attributes: [:name])
    end
end
