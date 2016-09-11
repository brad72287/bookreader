class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = current_user.books
  end

  def show
    if current_user
      @comment = current_user.comments.build
      @comment.book_id = @book.id
    end
  end

  def new
    @book = current_user.books.build
  end

  def edit
  end

  def create
    @book = current_user.books.build(book_params)
      if @book.save
         redirect_to user_books_path(@book), notice: 'Book was successfully created.' 
       else
         render :new 
      end
  end

  def update
      if @book.update(book_params)
        redirect_to @book, notice: 'Book was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @book.destroy
    redirect_to user_books_url(current_user), notice: 'Book was successfully destroyed.'
  end

  def book_comments
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author, :epub, :user_id, genre_ids: [], genres_attributes: [:name])
    end
end
