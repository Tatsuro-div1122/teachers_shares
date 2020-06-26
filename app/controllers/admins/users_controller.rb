class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all.page(params[:page]).per(15)
    @title = "会員一覧"
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
    redirect_to admins_users_path, notice: "先生を会員にしました"
    end
  end

  def category_users
    @title = "カテゴリー検索結果"
    @users = User.all
    if params[:school_type].present?
      @users.where!(school_type: params[:school_type])
    end
    if params[:subject].present?
      @users.where!(subject: params[:subject])
    end
    if params[:prefecture].present?
      @users.where!(prefecture: params[:prefecture])
    end
     @users = @users.page(params[:page]).reverse_order
    render 'index'
  end
end
