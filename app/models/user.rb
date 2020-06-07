# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  family_name            :string           not null
#  introduction           :text
#  last_name              :string           not null
#  prefecture             :integer          not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  school_name            :string           not null
#  school_type            :integer          not null
#  subject                :integer          not null
#  user_status            :boolean          not null
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

  validates :family_name, :last_name, :school_type, :prefecture, :school_name, :subject, presence: :true
  validates :introduction, length: {maximum: 250}

  has_one_attached :avatar

  enum school_type: {"--未選択--": 0, 小学校: 1, 中学校: 2, 高等学校: 3}, _suffix: true
  enum prefecture:  {
                      "--未選択--": 0,
                      北海道: 1,青森県: 2,岩手県: 3,宮城県: 4,秋田県:5,山形県:6,福島県:7,
                      茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
                      新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
                      岐阜県:21,静岡県:22,愛知県:23,三重県:24,
                      滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
                      鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
                      徳島県:36,香川県:37,愛媛県:38,高知県:39,
                      福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
                    }, _suffix: true
  enum subject: {"--未選択--":0, 国語: 1, 社会: 2, 数学: 3, 理科: 4, 英語: 5, 保健体育: 6, 家庭: 7, 技術: 8, 音楽: 9, 美術: 10, 情報: 11, その他: 12}, _suffix: true
  enum user_status: {会員: true, 退会: false}
end

