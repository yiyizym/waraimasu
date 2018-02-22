class ChangeWechatUnionId < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :wechat_unionid, :wechat_openid
  end
end
