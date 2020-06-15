class Admins::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.deleted_at == nil
      user.update(deleted_at: Time.current)
    redirect_to admins_users_path, alert: "先生を退会にしました"
    elsif user.deleted_at != nil
      user.update(deleted_at: nil)
    redirect_to admins_users_path, alert: "先生を会員にしました"
    end
  end
end
