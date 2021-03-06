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

ActiveRecord::Schema.define(version: 2019_12_05_151007) do

  create_table "building_reviews", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "cleanliness"
    t.integer "super"
    t.integer "noise"
    t.boolean "renew"
    t.integer "tenant_id"
    t.integer "building_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "buildings", force: :cascade do |t|
    t.string "address"
    t.string "neighborhood"
    t.text "description"
    t.integer "apt_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "landlord_id"
    t.string "image"
  end

  create_table "landlord_reviews", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "rating"
    t.boolean "hotness"
    t.integer "tenant_id"
    t.integer "landlord_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "landlords", force: :cascade do |t|
    t.string "name"
    t.string "nickname"
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tenants", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "avatar"
  end

end
