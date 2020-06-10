# == Schema Information
#
# Table name: lesson_bookmarks
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lesson_id  :integer
#  user_id    :integer
#
# Indexes
#
#  index_lesson_bookmarks_on_lesson_id  (lesson_id)
#  index_lesson_bookmarks_on_user_id    (user_id)
#
class LessonBookmark < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
end
