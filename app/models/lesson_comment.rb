# == Schema Information
#
# Table name: lesson_comments
#
#  id         :integer          not null, primary key
#  comment    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lesson_id  :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_lesson_comments_on_lesson_id  (lesson_id)
#  index_lesson_comments_on_user_id    (user_id)
#
class LessonComment < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  has_many :lesson_comment_likes, dependent: :destroy
  validates :comment, presence: :true

  def lesson_comment_liked_by?(user)
    lesson_comment_likes.where(user_id: user.id).exists?
  end
end
