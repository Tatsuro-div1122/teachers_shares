class Admins::LessonsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @lessons = Lesson.all.page(params[:page]).reverse_order
    @title = "授業アイデア一覧"
  end

  def show
    @lesson = Lesson.find(params[:id])
    @lesson_comments = @lesson.lesson_comments.includes(:user).page(params[:page]).reverse_order
    @accept_image_types = ['.jpeg', '.jpg', '.gif', '.png', '.heic']
    # 添付ファイルが上記の配列のファイル形式に合うものは表示する
  end

  def destroy
    lesson = Lesson.find(params[:id])
    lesson.destroy
    redirect_to admins_lessons_path, alert: "授業アイデアを削除しました"
  end

  def category_lessons
    if params[:school_type]
      @title = "#{params[:school_type]} の授業アイデア一覧"
      @lessons = Lesson.where(school_type: params[:school_type]).includes(:user).page(params[:page]).reverse_order
    elsif params[:subject]
      @title = "#{params[:subject]} の授業アイデア一覧"
      @lessons = Lesson.where(subject: params[:subject]).includes(:user).page(params[:page]).reverse_order
    end
    render 'index'
  end

end
