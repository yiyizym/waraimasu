class CreateHolidays < ActiveRecord::Migration[5.1]
  def change
    create_table :holidays do |t|
      t.date :date , index: true, null: false, comment: '日期'
      t.string :holiday, null: false, comment: '节日名称'
    end
  end
end
