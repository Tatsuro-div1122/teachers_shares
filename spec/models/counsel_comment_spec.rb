# == Schema Information
#
# Table name: counsel_comments
#
#  id         :integer          not null, primary key
#  comment    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  counsel_id :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_counsel_comments_on_counsel_id  (counsel_id)
#  index_counsel_comments_on_user_id     (user_id)
#
require 'rails_helper'

RSpec.describe CounselComment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
