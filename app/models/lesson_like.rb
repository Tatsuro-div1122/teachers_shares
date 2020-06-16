# == Schema Information
#
# Table name: lesson_likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lesson_id  :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_lesson_likes_on_lesson_id  (lesson_id)
#  index_lesson_likes_on_user_id    (user_id)
#
class LessonLike < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
end
