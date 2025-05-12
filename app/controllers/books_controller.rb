# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy mark_as_available]
  # before_action :authenticate_user!, only: %i[new create edit update destroy]

  # GET /books
  def index
    @books = Book.all.order(created_at: :asc)
  end

  def available
    @books = Book.all.order(created_at: :asc).where(available: true)
  end

  def mark_as_available
    @book.update(available: true, reader_id: nil)
    redirect_to available_books_path
  end

  # GET /books/slug
  def show; end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/slug/edit
  def edit; end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to book_path(@book.id), notice: 'Livro foi criado.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/slug
  def update
    @book.title = book_params[:title]
    @book.description = book_params[:description]
    @book.reader_id = book_params[:reader_id]
    @book.cover_image.attach(book_params[:cover_image]) if book_params[:cover_image].present?
    @book.reader_id.present? ? @book.update(available: false) : @book.update(available: true)

    if @book.save
      redirect_to book_path(@book.id), notice: 'Livro foi atualizado com sucesso!.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
    redirect_to books_url, notice: 'Livro foi apagado.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a list of trusted parameters through, but add :body, and use slug instead of id in the URL.
  def book_params
    params.require(:book).permit(:title, :description, :cover_image, :reader_id)
  end
end
