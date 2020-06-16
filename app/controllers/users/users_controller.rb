class Users::UsersController < ApplicationController
  before_action :set_user, except: [:index]
  def index
    @users = User.where(deleted_at: nil)
    @title = "参加している先生たち"
  end

  def show
    @total_likes = LessonLike.where(user_id: current_user.id).count + LessonCommentLike.where(user_id: current_user.id).count
    @users = User.where(deleted_at: nil, prefecture: current_user.prefecture).where.not(id: current_user.id).order("RANDOM()").limit(5)
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
    @lessons = @user.bookmark_lessons.includes(:user).order("created_at DESC")
    render 'users/lessons/index'
  end

  def own_lessons
    @title = "#{@user.last_name}  #{@user.first_name} 先生の授業アイデア"
    @lessons = @user.lessons.includes(:user).order("created_at DESC")
    render 'users/lessons/index'
  end

  def delete_account
  end

  def update_account
    if @user == current_user
      @user.update(deleted_at: Time.current)
      reset_session
      redirect_to root_path, notice: "先生のアカウントは削除されました。ご利用ありがとうございました。"
    else
      redirect_to root_path, alert: "他の先生のアカウントページです。"
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
    redirect_to root_path, alert: "すでに退会された先生です" if @user.deleted_at != nil
  end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :school_type, :prefecture, :school_name, :subject, :year, :introduction, :avatar)
  end

end
