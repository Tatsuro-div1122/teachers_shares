class Users::LessonsController < ApplicationController
  def index
    @title = "授業アイデア"
    @lessons = Lesson.includes(:user).order("created_at DESC")
    # @lessons = Lesson.joins(:user).where(users:{deleted_at: nil})
    # deleted_atスタンプがないユーザの投稿一覧を取得
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.user_id = current_user.id
    # if params[:back]
    #   render 'new'
    if @lesson.save
      redirect_to @lesson, notice: '新しい授業アイデアが投稿されました'
    else
      flash[:alert] = '必須事項を入力してください'
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

  # def confirm
  #   @lesson = Lesson.new(lesson_params)
  #   @lesson.file.attach(params[:lesson][:file])
  #   # render 'new' if @lesson.invalid?
  # end

  # def back
  #   render 'new'
  # end

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
      render 'edit'
    end
  end

  def destroy
    lesson = Lesson.find(params[:id])
    lesson.destroy
    redirect_to lessons_path
  end

  def category_lessons
    if params[:school_type]
      @title = "#{params[:school_type]} の授業アイデア"
      @lessons = Lesson.where(school_type: params[:school_type]).includes(:user).order("created_at DESC")
    elsif params[:subject]
      @title = "#{params[:subject]} の授業アイデア"
      @lessons = Lesson.where(subject: params[:subject]).includes(:user).order("created_at DESC")
    end
    render 'index'
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :description, :school_type, :grade, :subject, :file, :user_id)
  end
end
