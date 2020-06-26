# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  deleted_at             :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           not null
#  introduction           :text
#  last_name              :string           not null
#  prefecture             :integer          not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  school_name            :string           not null
#  school_type            :integer          not null
#  subject                :integer          not null
#  year                   :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, :first_name, :school_type, :prefecture, :school_name, :subject, presence: :true
  validates :introduction, length: {maximum: 400}

  has_one_attached :avatar
  #active storageの画像カラム

  #フォローフォロワー関連
  has_many :active_relationships, class_name: 'Relationship', foreign_key: :following_id, dependent: :destroy
    # フォローする側のUserから見て、フォローされる側のUserを(中間テーブルを介して)集める。なので親はfollowing_id(フォローする側)
  has_many :followings, through: :active_relationships, source: :follower
    # 中間テーブルを介して「follower」モデルのUser(フォローされた側)を集めることを「followings」と定義
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: :follower_id, dependent: :destroy
    # フォローされる側のUserから見て、フォローしてくる側のUserを(中間テーブルを介して)集める。なので親はfollower_id(フォローされる側)
  has_many :followers, through: :passive_relationships, source: :following
    # 中間テーブルを介して「following」モデルのUser(フォローする側)を集めることを「followers」と定義
  has_many :lessons, dependent: :destroy
  has_many :lesson_likes, dependent: :destroy
  has_many :lesson_bookmarks, dependent: :destroy
  has_many :bookmark_lessons, through: :lesson_bookmarks, source: :lesson
  has_many :lesson_comments, dependent: :destroy
  has_many :lesson_comment_likes, dependent: :destroy
  has_many :counsels, dependent: :destroy
  has_many :counsel_comments, dependent: :destroy
  has_many :counsel_comment_likes, dependent: :destroy
  has_many :messages
  has_many :sent_messages, through: :messages, source: :receiver
  has_many :reverses_of_message, class_name: 'Message', foreign_key: 'receiver_id'
  has_many :received_messages, through: :reverses_of_message, source: :user



  enum school_type: { 小学校: 0, 中学校: 1, 高校: 2}, _suffix: true
  enum prefecture:  {
                      北海道: 0,青森県: 1,岩手県: 2,宮城県: 3,秋田県: 4,山形県: 5,福島県: 6,
                      茨城県:7,栃木県:8,群馬県:9,埼玉県:10,千葉県:11,東京都:12,神奈川県:13,
                      新潟県:14,富山県:15,石川県:16,福井県:17,山梨県:18,長野県:19,
                      岐阜県:20,静岡県:21,愛知県:22,三重県:23,
                      滋賀県:24,京都府:25,大阪府:26,兵庫県:27,奈良県:29,和歌山県:29,
                      鳥取県:30,島根県:31,岡山県:32,広島県:33,山口県:34,
                      徳島県:35,香川県:36,愛媛県:37,高知県:38,
                      福岡県:39,佐賀県:40,長崎県:41,熊本県:42,大分県:43,宮崎県:44,鹿児島県:45,沖縄県:46
                    }, _suffix: true
  enum subject: { 国語: 0, 社会: 1, 数学: 2, 理科: 3, 英語: 4, 保健体育: 5, 家庭: 6, 技術: 7, 音楽: 8, 美術: 9, 情報: 10, その他: 11}, _suffix: true


   # ユーザーアカウントを削除する代わりにdelete_atカラムにタイムスタンプを押す（論理削除）
  def soft_delete
    update_attribute(:deleted_at, Time.current)
  end

  # ユーザーアカウントが有効か確認する
  def active_for_authentication?
    super && !deleted_at
  end

  # 削除済みのユーザーにメッセージ
  def inactive_message
    !deleted_at ? super : :deleted_account
  end

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  def own_lesson?(lesson)
    self.id == lesson.user_id
  end

  def own_counsel?(counsel)
    self.id == counsel.user_id
  end

  def sent_messages(other_user, content)
    unless self == other_user
      self.messages.find_or_create_by(receiver_id: other_user.id, content: content)
    end
  end
end

