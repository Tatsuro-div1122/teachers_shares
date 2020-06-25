class Users::LessonBookmarksController < ApplicationController
  before_action :authenticate_user!
  def create
    @lesson = Lesson.find(params[:lesson_id])
    lesson_bookmarks = current_user.lesson_bookmarks.build(lesson_id: @lesson.id)
    lesson_bookmarks.save
    flash.now[:notice] = "ブックマークしました。"
  end

  def destroy
    @lesson = Lesson.find(params[:lesson_id])
    lesson_bookmarks = current_user.lesson_bookmarks.find_by(lesson_id: @lesson.id)
    lesson_bookmarks.destroy
    flash.now[:notice] = "ブックマークをはずしました。"
  end
end
