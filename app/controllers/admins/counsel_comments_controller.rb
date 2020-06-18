class Admins::CounselCommentsController < ApplicationController
  def destroy
    counsel_comment = CounselComment.find(params[:id])
    counsel_comment.destroy
    counsel = counsel_comment.counsel
    redirect_to admins_counsel_path(counsel), alert: "コメントを削除しました"
  end
end
