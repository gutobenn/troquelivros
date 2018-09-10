class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @available_books = @user.book_instances.select { |book| book.status == 'available' }
    @unavailable_books = @user.book_instances.select { |book| book.status == 'unavailable' }
  end

end
