class CreateUserProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_profiles do |t|
      t.references :user, foreign_key: true
      t.string :avatar, comment: '头像'
      t.string :name, comment: '姓名'
      t.string :phone, comment: '手机'
      t.string :email, comment: '邮箱'
      t.string :province, comment: '省份'
      t.string :city, comment: '城市'
      t.string :address, comment: '地址'
      t.timestamps
    end
  end
end
