class Users::LessonCommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @lesson = Lesson.find(params[:lesson_id])
    @lesson_comment = current_user.lesson_comments.new(lesson_comment_params)
    @lesson_comment.lesson_id = @lesson.id
    @lesson_comments = @lesson.lesson_comments.order("created_at DESC")
    unless @lesson_comment.save
      #redirect_to request.referer, notice: "コメントを投稿しました"
      flash.now[:alert] = "コメントを入力してください"
      @user = @lesson.user
      @lesson_comment = LessonComment.new
      render 'users/lessons/show'
    end
  end

  def destroy
    @lesson_comment = LessonComment.find(params[:id])
    lesson = @lesson_comment.lesson
    @lesson_comments = LessonComment.where(lesson_id: lesson.id).order("created_at DESC")
    if @lesson_comment.user != current_user
      redirect_to request.referer
    else
      @lesson_comment.destroy
      #redirect_to request.referer, alert: "コメントを削除しました"
    end
  end

  private
  def lesson_comment_params
    params.require(:lesson_comment).permit(:comment)
  end
end
