class Users::RelationshipsController < ApplicationController
  before_action :set_user
  before_action :count_total_likes
  def create
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
  end

  private
  def set_user
    @user = User.find(params[:id])
    redirect_to root_path, alert: "すでに退会された先生です" if @user.deleted_at != nil
  end

  def count_total_likes
    @total_likes = 0
    user_lessons = @user.lessons
    user_lessons.each do |user_lesson|
       @total_likes += LessonLike.where(lesson_id: user_lesson.id).count
    end
    user_lesson_comments = @user.lesson_comments
    user_lesson_comments.each do |user_lesson_comment|
       @total_likes += LessonCommentLike.where(lesson_commet_id: user_lesson_comment.id).count
    end
    user_counsel_comments = @user.counsel_comments
    user_counsel_comments.each do |user_counsel_comment|
       @total_likes += CounselCommentLike.where(counsel_comment_id: user_counsel_comment.id).count
    end
  end
end


