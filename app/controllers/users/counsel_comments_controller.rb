class Users::CounselCommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @counsel = Counsel.find(params[:counsel_id])
    @counsel_comment = current_user.counsel_comments.new(counsel_comment_params)
    @counsel_comment.counsel_id = @counsel.id
    @counsel_comments = @counsel.counsel_comments.order("created_at DESC")
    unless @counsel_comment.save
      flash.now[:alert] = "コメントを入力してください"
      @user = @counsel.user
      @counsel_comment = CounselComment.new
      render 'users/counsels/show'
    end
  end

  def destroy
    @counsel_comment = CounselComment.find(params[:id])
    counsel = @counsel_comment.counsel
    @counsel_comments = CounselComment.where(counsel_id: counsel.id).order("created_at DESC")
    if @counsel_comment.user != current_user
      redirect_to request.referer
    else
      @counsel_comment.destroy
      # redirect_to request.referer, alert: "コメントを削除しました"
    end
  end

  private
  def counsel_comment_params
    params.require(:counsel_comment).permit(:comment)
  end
end
