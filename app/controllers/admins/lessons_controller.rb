class Admins::LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
    @title = "授業アイデア一覧"
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def destroy
    lesson = Lesson.find(params[:id])
    lesson.destroy
    lesson.file.purge
    redirect_to admins_lessons_path, alert: "授業アイデアを削除しました"
  end

  def category_lessons
    if params[:school_type]
      @title = "#{params[:school_type]} の授業アイデア一覧"
      @lessons = Lesson.where(school_type: params[:school_type]).includes(:user).order("created_at DESC")
    elsif params[:subject]
      @title = "#{params[:subject]} の授業アイデア一覧"
      @lessons = Lesson.where(subject: params[:subject]).includes(:user).order("created_at DESC")
    end
    render 'index'
  end

end
