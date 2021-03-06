# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180309005602) do

  create_table "favorites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "joke_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["joke_id"], name: "index_favorites_on_joke_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "holidays", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "date", null: false, comment: "日期"
    t.string "holiday", null: false, comment: "节日名称"
    t.index ["date"], name: "index_holidays_on_date"
  end

  create_table "joke_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "joke_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jokes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.string "avatar", comment: "头像"
    t.string "name", comment: "姓名"
    t.string "phone", comment: "手机"
    t.string "email", comment: "邮箱"
    t.string "province", comment: "省份"
    t.string "city", comment: "城市"
    t.string "address", comment: "地址"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "wechat_openid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wechat_openid"], name: "index_users_on_wechat_openid", unique: true
  end

  add_foreign_key "user_profiles", "users"
end
