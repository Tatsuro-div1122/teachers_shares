class Users::CounselCommentLikesController < ApplicationController
  def create
    counsel_comment = CounselComment.find(params[:id])
    counsel_comment_like = current_user.counsel_comment_likes.new(counsel_comment_id: counsel_comment.id)
    counsel_comment_like.save
    redirect_to request.referer
  end

  def destroy
    counsel_comment = CounselComment.find(params[:id])
    counsel_comment_like = current_user.counsel_comment_likes.find_by(counsel_comment_id: counsel_comment.id)
    counsel_comment_like.destroy
    redirect_to request.referer
  end
end
