# == Schema Information
#
# Table name: lesson_comment_likes
#
#  id                :integer          not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  lesson_comment_id :integer          not null
#  user_id           :integer          not null
#
# Indexes
#
#  index_lesson_comment_likes_on_lesson_comment_id  (lesson_comment_id)
#  index_lesson_comment_likes_on_user_id            (user_id)
#
class LessonCommentLike < ApplicationRecord
  belongs_to :user
  belongs_to :lesson_comment
end
