# == Schema Information
#
# Table name: messages
#
#  id          :integer          not null, primary key
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  receiver_id :integer
#  user_id     :integer
#
# Indexes
#
#  index_messages_on_receiver_id  (receiver_id)
#  index_messages_on_user_id      (user_id)
#
class Message < ApplicationRecord
  belongs_to :user
  belongs_to :receiver, class_name: 'User'
  validates :content, presence: :true
end
