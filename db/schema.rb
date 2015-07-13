# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150713201731) do

  create_table "CP_ECOM_EQUIPMENTS", id: false, force: :cascade do |t|
    t.string  "setId",                limit: 255
    t.integer "sort_id",              limit: 4
    t.integer "id",                   limit: 8
    t.integer "netx_id",              limit: 8
    t.string  "name",                 limit: 255
    t.text    "description",          limit: 4294967295
    t.string  "model",                limit: 255
    t.string  "type",                 limit: 255
    t.string  "price",                limit: 255
    t.string  "list_price",           limit: 255
    t.string  "img_url",              limit: 255
    t.string  "default_row",          limit: 255
    t.integer "equipment_rental",     limit: 1
    t.integer "is_accessory",         limit: 1
    t.string  "line_details_img_url", limit: 255
  end

  create_table "address_book_masters", force: :cascade do |t|
    t.string  "label",         limit: 255
    t.string  "email",         limit: 255
    t.integer "partner_type",  limit: 4
    t.string  "isPrimary",     limit: 255
    t.string  "customer_type", limit: 255
    t.integer "type_num",      limit: 4
    t.string  "order_type",    limit: 255
    t.string  "signature",     limit: 255
    t.integer "isDynamic",     limit: 4
  end

  create_table "address_books", force: :cascade do |t|
    t.string  "label",       limit: 255
    t.string  "email",       limit: 255
    t.string  "partner_id",  limit: 255
    t.string  "isPrimary",   limit: 255
    t.string  "customer_id", limit: 255
    t.integer "type_num",    limit: 4
    t.string  "order_id",    limit: 255
    t.string  "signature",   limit: 255
    t.integer "isDynamic",   limit: 4
    t.integer "available",   limit: 4
  end

  add_index "address_books", ["type_num", "partner_id"], name: "idx_name", unique: true, using: :btree

  create_table "address_books_bck", force: :cascade do |t|
    t.string  "label",       limit: 255
    t.string  "email",       limit: 255
    t.string  "partner_id",  limit: 255
    t.string  "isPrimary",   limit: 255
    t.string  "customer_id", limit: 255
    t.integer "type_num",    limit: 4
    t.string  "order_id",    limit: 255
    t.string  "signature",   limit: 255
    t.integer "isDynamic",   limit: 4
    t.integer "available",   limit: 4
  end

  create_table "addresses", force: :cascade do |t|
    t.string   "address1",              limit: 255,                 null: false
    t.string   "address2",              limit: 255
    t.string   "city",                  limit: 255,                 null: false
    t.string   "state",                 limit: 255,                 null: false
    t.string   "country",               limit: 255, default: "USA", null: false
    t.string   "zip",                   limit: 255,                 null: false
    t.string   "address_type",          limit: 255
    t.binary   "uuid",                  limit: 16
    t.string   "company_name",          limit: 255
    t.string   "first_name",            limit: 255
    t.string   "middle_name",           limit: 255
    t.string   "last_name",             limit: 255
    t.string   "phone",                 limit: 255
    t.string   "email",                 limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id",              limit: 4
    t.string   "latitude",              limit: 255
    t.string   "longitude",             limit: 255
    t.string   "a_type",                limit: 255
    t.boolean  "add_on_address_change", limit: 1,   default: false
    t.string   "valid_address",         limit: 255
  end

  add_index "addresses", ["updated_at"], name: "index_addresses_on_updated_at", using: :btree
  add_index "addresses", ["uuid"], name: "index_addresses_on_uuid", using: :btree

  create_table "approvals", force: :cascade do |t|
    t.string   "uid",                     limit: 255
    t.string   "approved_by",             limit: 255
    t.string   "status",                  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id",                limit: 4
    t.string   "required_from",           limit: 255
    t.string   "partner_id",              limit: 255,   default: "1"
    t.string   "order_value",             limit: 255
    t.integer  "loc_count",               limit: 4,     default: 1
    t.string   "price_without_tax",       limit: 255
    t.string   "discount_type",           limit: 255
    t.text     "required_from_array",     limit: 65535
    t.text     "level_approved_by_array", limit: 65535
    t.string   "mailing_type",            limit: 255
  end

  create_table "attachments", force: :cascade do |t|
    t.string   "uniq_id",                 limit: 255
    t.string   "attachment_file_name",    limit: 255
    t.string   "attachment_content_type", limit: 255
    t.string   "attachment_file_size",    limit: 255
    t.string   "attachment_updated_at",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "az_shipcost", id: false, force: :cascade do |t|
    t.string "SETID",                   limit: 5,  null: false
    t.string "CARRIERID",               limit: 15, null: false
    t.string "PRODUCT_ID",              limit: 20, null: false
    t.string "PARTNUMBER",              limit: 20, null: false
    t.string "GRND_COST",               limit: 20, null: false
    t.string "3DAY_COST",               limit: 20, null: false
    t.string "2DAY_COST",               limit: 20, null: false
    t.string "OVERNIGHT_COST",          limit: 20, null: false
    t.string "PRIORITY_OVERNIGHT_COST", limit: 20, null: false
    t.string "OVERNIGHT_EARLYAM_COST",  limit: 20, null: false
    t.date   "ROW_ADDED_DTTM",                     null: false
    t.string "ROW_ADDED_OPRID",         limit: 30
    t.date   "ROW_LASTMANT_DTTM",                  null: false
    t.string "ROW_LASTMANT_OPRID",      limit: 30
  end

  create_table "base_stations", force: :cascade do |t|
    t.string   "label",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "equipment_id", limit: 4
    t.integer  "line_item_id", limit: 4
  end

  create_table "billing_csvs", force: :cascade do |t|
    t.string   "uuid",         limit: 255
    t.text     "csv_data",     limit: 4294967295
    t.string   "current_user", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "call_recording_configured_supervisors", force: :cascade do |t|
    t.string  "acct_service_id",     limit: 255
    t.string  "person_id",           limit: 255
    t.string  "supervisor_id",       limit: 255
    t.integer "annotations_enabled", limit: 4,   default: 1
    t.integer "rating_enabled",      limit: 4,   default: 1
    t.string  "bsft_user_id",        limit: 255
  end

  create_table "call_recordings", force: :cascade do |t|
    t.string   "enterprise_id",  limit: 255
    t.string   "group_id",       limit: 255
    t.string   "recording_name", limit: 255
    t.string   "from_caller",    limit: 255
    t.string   "to_caller",      limit: 255
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "duration",       limit: 255
    t.text     "file_path",      limit: 65535
    t.string   "file_name",      limit: 255
    t.string   "file_type",      limit: 255
    t.string   "file_size",      limit: 255
    t.text     "annotation",     limit: 16777215
    t.string   "rating",         limit: 255
    t.string   "bsft_user_id",   limit: 255
    t.string   "person_id",      limit: 255
    t.string   "tag",            limit: 255
    t.integer  "available",      limit: 4
  end

  create_table "carriers", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

