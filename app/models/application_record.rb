class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  #ユーザが退会しているかどうかを判定する
  def user_deleted?(user)
    user.deleted_at.present?
  end
end
