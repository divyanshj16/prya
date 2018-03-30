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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20180330080847) do
=======
ActiveRecord::Schema.define(version: 20180330085920) do
>>>>>>> 5f695e745fd9485068eeddd13536e4e04f56e5be

  create_table "founderships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "startup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["startup_id"], name: "index_founderships_on_startup_id"
    t.index ["user_id"], name: "index_founderships_on_user_id"
  end

  create_table "palletes", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "startup_id"
    t.integer "user_id"
    t.index ["startup_id"], name: "index_posts_on_startup_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "presentations", force: :cascade do |t|
    t.integer "startup_id"
    t.integer "pallete_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "animation"
    t.boolean "publish", default: false
    t.index ["pallete_id"], name: "index_presentations_on_pallete_id"
    t.index ["startup_id"], name: "index_presentations_on_startup_id"
  end

  create_table "startup_interests", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "startup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["startup_id"], name: "index_startup_interests_on_startup_id"
    t.index ["tag_id"], name: "index_startup_interests_on_tag_id"
  end

  create_table "startups", force: :cascade do |t|
    t.string "title"
    t.string "about"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sustage_id"
    t.index ["sustage_id"], name: "index_startups_on_sustage_id"
  end

  create_table "sustages", force: :cascade do |t|
    t.string "stage", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stage"], name: "index_sustages_on_stage"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "isinvestor", default: false
    t.string "username"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "covph_file_name"
    t.string "covph_content_type"
    t.integer "covph_file_size"
    t.datetime "covph_updated_at"
    t.string "accred"
    t.string "experience"
    t.string "details"
    t.string "ident"
    t.boolean "invverif", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
