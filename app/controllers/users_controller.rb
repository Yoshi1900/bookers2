class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update ,:index, :show]

  def show
    @user = User.find(params[:id])
    @users = User.all
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @book = Book.new
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
  end
end
