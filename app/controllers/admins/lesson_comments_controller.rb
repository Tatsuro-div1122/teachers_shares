class Admins::LessonCommentsController < ApplicationController
  def index
    lesson = Lesson.find(params[:id])
    @lesson_comments = lesson.lesson_comments
  end

  def destroy
    lesson_comment = LessonComment.find(params[:id])
    lesson_comment.destroy
    lesson = lesson_comment.lesson
    redirect_to admins_lesson_path(lesson), alert: "コメントを削除しました"
  end
end
