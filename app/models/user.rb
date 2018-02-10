class User < ApplicationRecord
  has_one :profile, class_name: 'UserProfile', dependent: :destroy

  validates :wechat_unionid, presence: true, uniqueness: true
end
