class Admins::LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
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
end
