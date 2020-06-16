class Admins::UsersController < ApplicationController
  def index
    @users = User.all
    @title = "会員一覧"
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.deleted_at == nil
      user.update(deleted_at: Time.current)
    redirect_to admins_users_path, notice: "先生を退会にしました"
    elsif user.deleted_at != nil
      user.update(deleted_at: nil)
    redirect_to admins_users_path, notice: "先生を会員にしました"
    end
  end

  def category_users
    @title = "カテゴリー検索結果"
    @users = User.where(school_type: params[:school_type])
                 .where(subject: params[:subject])
                 .where(prefecture: params[:prefecture])
    render 'index'
  end
end
