class UsersController < ApplicationController
  before_action :set_user, only: [:show, :follows, :followers]
  def index
    @users = User.where(deleted_at: nil)
    @title = "参加している先生たち"
  end

  def show
    @total_likes = LessonLike.where(user_id: current_user.id).count + LessonCommentLike.where(user_id: current_user.id).count
    @users = User.where(deleted_at: nil, prefecture: current_user.prefecture).where.not(id: current_user.id).order("RANDOM()").limit(5)
  end

  def follows
    @users = @user.followings.where(deleted_at: nil)
    @title = "フォロー中の先生たち"
    render 'index'
  end

  def followers
    @users = @user.followers.where(deleted_at: nil)
    @title = "フォロワーの先生たち"
    render 'index'
  end

  private
  def set_user
    @user = User.find(params[:id])
    redirect_to root_path, alert: "すでに退会された先生です" unless @user.deleted_at == nil
  end
end
