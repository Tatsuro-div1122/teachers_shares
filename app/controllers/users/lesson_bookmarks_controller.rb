class Users::LessonBookmarksController < ApplicationController
  def create
    lesson = Lesson.find(params[:lesson_id])
    lesson_bookmarks = current_user.lesson_bookmarks.build(lesson_id: lesson.id)
    lesson_bookmarks.save
    redirect_to request.referer, notice: 'ブックマークしました'
  end

  def destroy
    lesson = Lesson.find(params[:lesson_id])
    lesson_bookmarks = current_user.lesson_bookmarks.find_by(lesson_id: lesson.id)
    lesson_bookmarks.destroy
    redirect_to request.referer, alert: 'ブックマークをはずしました'
  end
end
