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

ActiveRecord::Schema.define(version: 20161111012420) do

  create_table "categories", force: :cascade do |t|
    t.string   "category_name"
    t.string   "description"
    t.integer  "left_node"
    t.integer  "right_node"
    t.integer  "depth"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string   "color_name"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_colors_on_product_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "rating"
    t.integer  "product_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_comments_on_product_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_favorites_on_product_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "order_details", force: :cascade do |t|
    t.integer  "quantity"
    t.string   "product_uuid"
    t.string   "product_name"
    t.integer  "product_id"
    t.integer  "order_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["order_id"], name: "index_order_details_on_order_id"
    t.index ["product_id"], name: "index_order_details_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "status",           default: 0
    t.float    "total_amount"
    t.string   "message"
    t.integer  "user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "shipping_name"
    t.string   "shipping_email"
    t.string   "shipping_address"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "uuid"
    t.string   "product_name"
    t.text     "description"
    t.string   "image"
    t.float    "price"
    t.float    "rating"
    t.integer  "quantity"
    t.integer  "category_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.string   "size_name"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sizes_on_product_id"
  end

  create_table "suggest_products", force: :cascade do |t|
    t.string   "product_name"
    t.text     "product_description"
    t.integer  "status",              default: 0
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["user_id"], name: "index_suggest_products_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone_number"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
