class Users::CounselCommentsController < ApplicationController
  def create
    @counsel = Counsel.find(params[:counsel_id])
    counsel_comment = current_user.counsel_comments.new(counsel_comment_params)
    counsel_comment.counsel_id = @counsel.id
    if counsel_comment.save
      redirect_to request.referer, notice: "コメントを投稿しました"
    else
      flash.now[:alert] = "コメントを入力してください"
      @user = @counsel.user
      @counsel_comments = @counsel.counsel_comments.includes(:user).order("created_at DESC")
      @counsel_comment = CounselComment.new
      render 'users/counsels/show'
    end
  end

  def destroy
    counsel_comment = CounselComment.find(params[:counsel_id])
    if counsel_comment.user != current_user
      redirect_to request.referer
    else
      counsel_comment.destroy
      redirect_to request.referer, alert: "コメントを削除しました"
    end
  end

  private
  def counsel_comment_params
    params.require(:counsel_comment).permit(:comment)
  end
end
