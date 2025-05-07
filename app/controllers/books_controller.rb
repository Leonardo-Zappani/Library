class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]
  # before_action :authenticate_user!, only: %i[new create edit update destroy]

  # GET /books
  def index
    @books = Book.all.order(created_at: :asc).where(available: true)
  end

  def artigos
    @books = Book.all.order(created_at: :asc).where(draft: false)
  end

  def review
    @books = Book.all.order(created_at: :asc).where(reviewer: current_user.name).where(draft: true)
  end

  def write
    @books = Book.all.order(created_at: :asc)
  end

  def review_grade
    @book = Book.find(params[:id])
    review_grades = @book.review_grades
    review_grades << params[:grade].to_i

    weight_grade = @book.weight_grade
    weight_grade << params[:weight_grade].to_i
    @book.update(review_grades: review_grades, weight_grade: weight_grade)

    redirect_to books_path
  end

  # GET /books/slug
  def show; end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/slug/edit
  def edit; end

  def approve
    @book = Book.find(params[:id])
    @book.update(draft: false)
    redirect_to books_path
  end

  def publish
    @book = Book.find(params[:id])
    @book.update(published: true)
    redirect_to admin_dashboard_index_path
  end

  def assign
    @book = Book.find(params[:id])
    @book.update(reviewer: params[:name])
    redirect_to books_path
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to book_path(@book.id), notice: "Blog post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/slug
  def update
    @book.slug = params[:book][:slug]
    if @book.save && @book.update(book_params)
      redirect_to book_path(@book.id), notice: "Blog post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
    redirect_to books_url, notice: "Blog post was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a list of trusted parameters through, but add :body, and use slug instead of id in the URL.
  def book_params
    params.require(:book).permit(:title, :slug, :description, :body, :cover_image, :draft, :name, :reviewer)
  end
end
