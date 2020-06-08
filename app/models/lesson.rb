# == Schema Information
#
# Table name: lessons
#
#  id          :integer          not null, primary key
#  description :text
#  grade       :integer
#  school_type :integer
#  subject     :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
# Indexes
#
#  index_lessons_on_user_id  (user_id)
#
class Lesson < ApplicationRecord
  belongs_to :user
  has_many_attached :files

  enum grade: {"1年生": 0, "2年生": 1, "3年生": 2,"4年生": 3,"5年生": 4,"6年生": 5}
  enum school_type: {"小学校": 0, "中学校": 1, "高校": 2}
  enum subject: {国語: 0, 社会: 1, "算数/数学": 2, 理科: 3, 英語: 4, 保健体育: 5, 家庭: 6, 技術: 7, 音楽: 8, 美術: 9, 情報: 10, 図工: 11, 生活: 12, 道徳: 13, 総合: 14, その他: 15}

end
