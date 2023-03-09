class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    # 他のユーザーからのアクセスを制限
    is_matching_login_user
    # 関数の定義
    @book = Book.find(params[:id])
  end

  def update
    # 他のユーザーからのアクセスを制限
    is_matching_login_user
    # 関数の定義
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    # 他のユーザーからのアクセスを制限
    is_matching_login_user
    # 関数の定義
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user
    user_id = Book.find(params[:id]).user.id
    unless user_id == current_user.id
      redirect_to books_path
    end
  end

end
