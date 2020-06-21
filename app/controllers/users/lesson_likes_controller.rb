class Users::LessonLikesController < ApplicationController
  before_action :count_total_likes

  def create
    @lesson = Lesson.find(params[:lesson_id])
    lesson_like = current_user.lesson_likes.new(lesson_id: @lesson.id)
    lesson_like.save
  end

  def destroy
    @lesson = Lesson.find(params[:lesson_id])
    lesson_like = current_user.lesson_likes.find_by(lesson_id: @lesson.id)
    lesson_like.destroy
  end

  private

  def count_total_likes
    @total_likes = 0
    @user = User.find(params[:user_id])
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
