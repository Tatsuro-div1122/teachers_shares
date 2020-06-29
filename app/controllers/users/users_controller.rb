class Users::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:index, :category_users]
  before_action :correct_user, only: [:edit, :update, :lesson_bookmarks, :update_account, :delete_account]
  before_action :maybe_friends_users, only: [:show, :follows, :followers, :lesson_bookmarks, :own_lessons, :own_counsels]
  before_action :count_total_likes, only: [:show, :follows, :followers, :lesson_bookmarks, :own_lessons, :own_counsels]
  def index
    @users = User.where(deleted_at: nil).where.not(id: current_user.id).page(params[:page]).reverse_order
    @title = "参加している先生たち"
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'プロフィールを変更しました。'
    else
      render "edit"
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

  def follows
    @title = "フォロー中の先生"
    @follow_users = @user.followings.where(deleted_at: nil).page(params[:page]).reverse_order
  end

  def followers
    @title = "フォロワーの先生"
    @follow_users = @user.followers.where(deleted_at: nil).page(params[:page]).reverse_order
    render 'follows'
  end

  def own_lessons
    @lessons = @user.lessons.includes(:user).page(params[:page]).reverse_order
  end

  def lesson_bookmarks
    @lessons = @user.bookmark_lessons.includes(:user).page(params[:page]).reverse_order
    render 'own_lessons'
  end

  def own_counsels
    @counsels = @user.counsels.includes(:user).page(params[:page]).reverse_order
  end

  def delete_account
  end

  def update_account
    @user.update(deleted_at: Time.current)
    reset_session
    redirect_to root_path, alert: "先生のアカウントは削除されました。ご利用ありがとうございました。"
  end

  private

  def set_user
    @user = User.find(params[:id])
    if @user.deleted_at != nil
      redirect_to root_path, alert: "すでに退会された先生です"
    end
  end

  def correct_user
    if @user != current_user
      redirect_to root_path, alert: "他の先生のアカウントページです。" 
    end
  end

  def maybe_friends_users
    if @user == current_user
      @users = User.where(deleted_at: nil, prefecture: current_user.prefecture)
                   .where.not(id: current_user.id)
                   .sample(5)
    end
  end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :school_type, :prefecture, :school_name, :subject, :year, :introduction, :avatar)
  end

  def count_total_likes
    @total_likes = 0
    user_lessons = @user.lessons
    user_lessons.each do |user_lesson|
       @total_likes += LessonLike.where(lesson_id: user_lesson.id).count
    end
    user_lesson_comments = @user.lesson_comments
    user_lesson_comments.each do |user_lesson_comment|
       @total_likes += LessonCommentLike.where(lesson_comment_id: user_lesson_comment.id).count
    end
    user_counsel_comments = @user.counsel_comments
    user_counsel_comments.each do |user_counsel_comment|
       @total_likes += CounselCommentLike.where(counsel_comment_id: user_counsel_comment.id).count
    end
  end
end
