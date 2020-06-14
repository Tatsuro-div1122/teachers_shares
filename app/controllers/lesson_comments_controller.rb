class LessonCommentsController < ApplicationController
  def create
    @lesson = Lesson.find(params[:lesson_id])
    lesson_comment = current_user.lesson_comments.new(lesson_comment_params)
    lesson_comment.lesson_id = @lesson.id
    if lesson_comment.save
      redirect_to request.referer, notice: "コメントを投稿しました"
    else
      flash.now[:alert] = "コメントを入力してください"
      @user = @lesson.user
      @lesson_comments = @lesson.lesson_comments.includes(:user).order("created_at DESC")
      @lesson_comment = LessonComment.new
      render 'lessons/show'
    end
  end

  def destroy
    lesson_comment = LessonComment.find(params[:lesson_id])
    if lesson_comment.user != current_user
      redirect_to request.referer
    else
      lesson_comment.destroy
      redirect_to request.referer, alert: "コメントを削除しました"
    end
  end

  private
  def lesson_comment_params
    params.require(:lesson_comment).permit(:comment)
  end
end
