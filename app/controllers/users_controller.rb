class UsersController < ApplicationController
  before_action :set_user, except: [:index]
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

  def lesson_bookmarks
    @title = "ブックマークリスト"
    @lessons = user.bookmark_lessons.includes(:user).order("created_at DESC")
    render 'lessons/index'
  end

  def own_lessons
    @title = "#{user.family_name + user.last_name} 先生の授業アイデア"
    @lessons = user.lessons.includes(:user).order("created_at DESC")
    render 'lessons/index'
  end

  private
  def set_user
    @user = User.find(params[:id])
    redirect_to root_path, alert: "すでに退会された先生です" unless @user.deleted_at == nil
  end
end
