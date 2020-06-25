class Users::CounselCommentLikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @counsel_comment = CounselComment.find(params[:id])
    counsel_comment_like = current_user.counsel_comment_likes.new(counsel_comment_id: @counsel_comment.id)
    counsel_comment_like.save
  end

  def destroy
    @counsel_comment = CounselComment.find(params[:id])
    counsel_comment_like = current_user.counsel_comment_likes.find_by(counsel_comment_id: @counsel_comment.id)
    counsel_comment_like.destroy
  end
end
