class Users::LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_lesson_user, only: [:edit, :update, :destroy]

  def index
    @title = "授業アイデア"
    @lessons = Lesson.includes(:user).page(params[:page]).reverse_order
    # @lessons = Lesson.joins(:user).where(users:{deleted_at: nil})
    # deleted_atスタンプがないユーザの投稿一覧を取得
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.user_id = current_user.id
    if @lesson.save
      redirect_to @lesson, notice: '新しい授業アイデアが投稿されました'
    else
      flash[:alert] = '記入事項を確認してください'
      render 'new'
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    @lesson_comment = LessonComment.new
    @lesson_comments = @lesson.lesson_comments.includes(:user).order("created_at DESC")
    @accept_image_types = ['.jpeg', '.jpg', '.gif', '.png', '.heic']
    # 添付ファイルが上記の配列のファイル形式に合うものは表示する
  end

  def edit
  end

  def update
      if @lesson.update(lesson_params)
        redirect_to lesson_path(@lesson), notice: "授業内容が更新されました"
      else
        flash.now[:alert] = "記入事項を確認してください"
        render 'edit'
      end
  end

  def destroy
    @lesson.destroy
    redirect_to lessons_path, alert: "授業アイデアを削除しました。"
  end

  def category_lessons
    if params[:school_type]
      @title = "#{params[:school_type]} の授業アイデア"
      @lessons = Lesson.where(school_type: params[:school_type]).includes(:user).page(params[:page]).reverse_order
    elsif params[:subject]
      @title = "#{params[:subject]} の授業アイデア"
      @lessons = Lesson.where(subject: params[:subject]).includes(:user).page(params[:page]).reverse_order
    end
    render 'index'
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :description, :school_type, :grade, :subject, :user_id, files: [])
  end

  def correct_lesson_user
    @lesson = Lesson.find(params[:id])
    redirect_to root_path, alert: "他の先生のアカウントページです。" if @lesson.user_id != current_user.id
  end
end

