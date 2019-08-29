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

ActiveRecord::Schema.define(version: 2019_08_26_052026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "capabilities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favourite_shops", force: :cascade do |t|
    t.integer "user_id"
    t.integer "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "laundries", force: :cascade do |t|
    t.string "name"
    t.float "delivery_cost"
    t.float "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "laundry_capabilities", force: :cascade do |t|
    t.integer "laundry_id"
    t.integer "capability_id"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_id"
    t.integer "order_id"
    t.integer "shop_id"
    t.string "title"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_laundries", force: :cascade do |t|
    t.integer "order_id"
    t.integer "laundry_id"
    t.float "cost"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "owner_id"
    t.integer "assignee_id"
    t.integer "shop_id"
    t.string "order_type"
    t.string "pick_location"
    t.string "pickup_time"
    t.string "pickup_date"
    t.string "delivery_time"
    t.string "delivery_date"
    t.string "status", default: "pending"
    t.float "cost"
    t.float "pick_lat"
    t.float "pick_lng"
    t.float "shop_lat"
    t.float "shop_lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.float "rating"
    t.integer "user_id"
    t.integer "shop_id"
    t.text "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reported_orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "order_id"
    t.string "reason"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shop_capabilities", force: :cascade do |t|
    t.bigint "capability_id"
    t.bigint "shop_id"
    t.integer "laundry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["capability_id"], name: "index_shop_capabilities_on_capability_id"
    t.index ["shop_id"], name: "index_shop_capabilities_on_shop_id"
  end

  create_table "shop_services", force: :cascade do |t|
    t.integer "shop_id"
    t.integer "laundry_id"
    t.float "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade do |t|
    t.integer "vendor_id"
    t.string "name"
    t.string "description"
    t.time "opening_time"
    t.time "closing_time"
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.float "rating", default: 5.0
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.boolean "approved", default: false
    t.boolean "online", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "user_name"
    t.string "email"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "phone"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "ride_name"
    t.string "role", default: "customer"
    t.boolean "phone_verified", default: false
    t.boolean "status", default: false
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "user_name"
    t.string "phone"
    t.boolean "phone_verified", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_vendors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_vendors_on_reset_password_token", unique: true
  end

  add_foreign_key "shop_capabilities", "capabilities"
  add_foreign_key "shop_capabilities", "shops"
end
