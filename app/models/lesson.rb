# == Schema Information
#
# Table name: lessons
#
#  id          :integer          not null, primary key
#  description :text             not null
#  grade       :integer          not null
#  school_type :integer          not null
#  subject     :integer          not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_lessons_on_user_id  (user_id)
#
class Lesson < ApplicationRecord

  validates :school_type, :grade, :subject, :title, :description, presence: :true

  belongs_to :user
  has_many_attached :files
  has_many :lesson_likes, dependent: :destroy
  has_many :lesson_bookmarks, dependent: :destroy
  has_many :lesson_comments, dependent: :destroy

  enum grade: {"1年生": 0, "2年生": 1, "3年生": 2,"4年生": 3,"5年生": 4,"6年生": 5}
  enum school_type: {"小学校": 0, "中学校": 1, "高校": 2}
  enum subject: {国語: 0, 社会: 1, "算数/数学": 2, 理科: 3, 英語: 4, 保健体育: 5, 家庭: 6, 技術: 7, 音楽: 8, 美術: 9, 情報: 10, 図工: 11, 生活: 12, 道徳: 13, 総合: 14, その他: 15}

  def lesson_liked_by?(user)
    lesson_likes.where(user_id: user.id).exists?
  end
  #lessonがユーザーに参考になった！されているかどうか判定

  def lesson_bookmarked_by?(user)
    lesson_bookmarks.where(user_id: user.id).exists?
  end
  #lessonがユーザーにブックマークされているかどうか判定

end
