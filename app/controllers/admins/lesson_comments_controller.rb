class Admins::LessonCommentsController < ApplicationController
  def destroy
    lesson_comment = LessonComment.find(params[:id])
    lesson_comment.destroy
    lesson = lesson_comment.lesson
    redirect_to admins_lesson_path(lesson), alert: "コメントを削除しました"
  end
end
