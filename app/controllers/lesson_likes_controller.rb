class LessonLikesController < ApplicationController
  def create
    lesson = Lesson.find(params[:lesson_id])
    lesson_like = current_user.lesson_likes.new(lesson_id: lesson.id)
    lesson_like.save
    redirect_to request.referer
  end

  def destroy
    lesson = Lesson.find(params[:lesson_id])
    lesson_like = current_user.lesson_likes.find_by(lesson_id: lesson.id)
    lesson_like.destroy
    redirect_to request.referer
  end
end
