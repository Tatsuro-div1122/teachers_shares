# == Schema Information
#
# Table name: lesson_bookmarks
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lesson_id  :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_lesson_bookmarks_on_lesson_id  (lesson_id)
#  index_lesson_bookmarks_on_user_id    (user_id)
#
require 'rails_helper'

RSpec.describe LessonBookmark, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
