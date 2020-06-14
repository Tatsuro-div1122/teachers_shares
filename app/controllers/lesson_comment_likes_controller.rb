class LessonCommentLikesController < ApplicationController
  def create
    lesson_comment = LessonComment.find(params[:id])
    lesson_comment_like = current_user.lesson_comment_likes.new(lesson_comment_id: lesson_comment.id)
    lesson_comment_like.save
    redirect_to request.referer
  end

  def destroy
    lesson_comment = LessonComment.find(params[:id])
    lesson_comment_like = current_user.lesson_comment_likes.find_by(lesson_comment_id: lesson_comment.id)
    lesson_comment_like.destroy
    redirect_to request.referer
  end
end
