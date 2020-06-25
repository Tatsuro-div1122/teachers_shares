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
class CounselComment < ApplicationRecord
  belongs_to :user
  belongs_to :counsel
  has_many :counsel_comment_likes, dependent: :destroy
  
  validates :comment, presence: :true

  def counsel_comment_liked_by?(user)
    counsel_comment_likes.where(user_id: user.id).exists?
  end
end
