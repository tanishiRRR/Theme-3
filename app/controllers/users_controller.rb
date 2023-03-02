class UsersController < ApplicationController
  def show
    @book = User.find(params[:id])
    @books = @user.books
  end

  def edit
  end
end
