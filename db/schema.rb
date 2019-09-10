# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_09_212630) do

  create_table "adoptions", force: :cascade do |t|
    t.integer "owner_id", null: false
    t.integer "dog_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "cat_id"
    t.index ["cat_id"], name: "index_adoptions_on_cat_id"
    t.index ["dog_id"], name: "index_adoptions_on_dog_id"
    t.index ["owner_id"], name: "index_adoptions_on_owner_id"
  end

  create_table "cats", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "age"
    t.string "img_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "age"
    t.string "img_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "username"
  end

  add_foreign_key "adoptions", "cats"
  add_foreign_key "adoptions", "dogs"
  add_foreign_key "adoptions", "owners"
end
