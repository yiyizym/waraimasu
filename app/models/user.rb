class User < ApplicationRecord
  has_many :favorites
  has_many :jokes, through: :favorites
  
  has_one :profile, class_name: 'UserProfile', dependent: :destroy

  validates :wechat_unionid, presence: true, uniqueness: true
end
