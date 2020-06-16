# == Schema Information
#
# Table name: lesson_comments
#
#  id         :integer          not null, primary key
#  comment    :text             default(""), not null
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
require 'rails_helper'

RSpec.describe LessonComment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
