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
require 'rails_helper'

RSpec.describe Counsel, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
