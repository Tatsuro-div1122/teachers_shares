class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def user_deleted?(user)
    user.deleted_at.present?
  end
  #ユーザが退会しているかどうかを判定する
end
