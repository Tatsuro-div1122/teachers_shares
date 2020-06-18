# == Schema Information
#
# Table name: counsels
#
#  id          :integer          not null, primary key
#  category    :integer          not null
#  description :text             not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_counsels_on_user_id  (user_id)
#
class Counsel < ApplicationRecord
  belongs_to :user
  has_many :counsel_comments, dependent: :destroy

  enum category: {授業: 0, 学級経営: 1, 生徒指導: 2, 部活動: 3, 進路指導: 4, 校務分掌: 5, 行事: 6, 職員関係: 7, その他: 8}

  # def lesson_liked_by?(user)
  #   counsel_likes.where(user_id: user.id).exists?
  # end
  # #counselがユーザーに参考になった！されているかどうか判定

end
