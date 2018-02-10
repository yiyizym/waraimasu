class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :wechat_unionid, null: false, comment: '微信用户 UnionID'
      t.timestamps
    end
    add_index :users, :wechat_unionid, unique: true
  end
end
