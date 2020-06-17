# == Schema Information
#
# Table name: counsel_comment_likes
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  counsel_comment_id :integer          not null
#  user_id            :integer          not null
#
# Indexes
#
#  index_counsel_comment_likes_on_counsel_comment_id  (counsel_comment_id)
#  index_counsel_comment_likes_on_user_id             (user_id)
#
require 'rails_helper'

RSpec.describe CounselCommentLike, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
