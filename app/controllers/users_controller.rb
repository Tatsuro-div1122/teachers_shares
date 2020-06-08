class UsersController < ApplicationController
  def index
    @users = User.where(deleted_at: nil)
  end

  def show
    @user = User.find(params[:id])
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  private
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end
