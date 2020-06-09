# == Schema Information
#
# Table name: lesson_likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lesson_id  :integer
#  user_id    :integer
#
class LessonLike < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
end
