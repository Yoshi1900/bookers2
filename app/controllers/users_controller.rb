class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update , :show]




  def show
    @user = User.find(params[:id])
    @users = User.all
    @userbooks = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @user = current_user
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
   if @user.update(user_params)
    redirect_to user_path
   else
     render :edit
   end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path
    end
  end
end
