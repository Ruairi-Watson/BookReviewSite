class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  def index
    @books = Book.all  # Fetch books from the database
  end

  def show; end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: "Book was successfully created."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: "Book was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: "Book was successfully deleted."
  end

  private

  def set_book
    @book = Book.find_by(id: params[:id])
    redirect_to books_path, alert: "Book not found." if @book.nil?
  end

  def book_params
    params.require(:book).permit(:title, :author, :description)
  end
end
