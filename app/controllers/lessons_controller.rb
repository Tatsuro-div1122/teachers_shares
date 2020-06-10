class LessonsController < ApplicationController
  def index
    @title = "授業アイデア"
    @lessons = Lesson.includes(:user).order("created_at DESC")
    # @lessons = Lesson.joins(:user).where(users:{deleted_at: nil})
    # deleted_atスタンプがないユーザの投稿一覧を取得
  end

  def show
    @lesson = Lesson.find(params[:id])
    @user = @lesson.user
  end

  def new
    @lesson = Lesson.new
  end

  def confirm
    @lesson = Lesson.new(lesson_params)
    render :new if @lesson.valid?
  end

  def back
    render :new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.user_id = current_user.id
    if @lesson.save
      redirect_to lesson_path(@lesson), notice: '新しい授業アイデアが投稿されました'
    else
      flash.now[:alert] = "必須事項を記入してください"
      render :new
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    @lesson.user_id = current_user.id
    if @lesson.update(lesson_params)
      redirect_to lesson_path(@lesson), notice: "授業内容が更新されました"
    else
      flash.now[:alert] = "必須事項を記入してください"
      render :edit
    end
  end

  def destroy
    lesson = Lesson.find(params[:id])
    lesson.file.purge
    lesson.destroy
    redirect_to lessons_path
  end

  def lesson_bookmarks
    @title = "ブックマークリスト"
    @lessons = current_user.bookmark_lessons.includes(:user).order("created_at DESC")
    render 'index'
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :description, :school_type, :grade, :subject, :user_id, :file)
  end
end
