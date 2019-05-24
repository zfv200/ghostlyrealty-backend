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

ActiveRecord::Schema.define(version: 2019_05_23_145856) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "ghosts", force: :cascade do |t|
    t.string "username"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "password_digest"
    t.string "motto"
    t.boolean "featured"
    t.integer "credits"
    t.string "medium"
  end

  create_table "ghosts_roles", id: false, force: :cascade do |t|
    t.bigint "ghost_id"
    t.bigint "role_id"
    t.index ["ghost_id", "role_id"], name: "index_ghosts_roles_on_ghost_id_and_role_id"
    t.index ["ghost_id"], name: "index_ghosts_roles_on_ghost_id"
    t.index ["role_id"], name: "index_ghosts_roles_on_role_id"
  end

  create_table "haunts", force: :cascade do |t|
    t.bigint "ghost_id"
    t.bigint "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ghost_id"], name: "index_haunts_on_ghost_id"
    t.index ["house_id"], name: "index_haunts_on_house_id"
  end

  create_table "house_searches", force: :cascade do |t|
    t.bigint "search_id"
    t.bigint "house_id"
    t.index ["house_id"], name: "index_house_searches_on_house_id"
    t.index ["search_id"], name: "index_house_searches_on_search_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "address"
    t.integer "rooms"
    t.boolean "solo_haunt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.string "name"
    t.boolean "featured"
    t.boolean "burial_ground"
    t.bigint "medium_id"
    t.boolean "new_family"
    t.text "description"
    t.boolean "witch_friendly"
    t.float "spook_score"
    t.index ["medium_id"], name: "index_houses_on_medium_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "searches", force: :cascade do |t|
    t.bigint "ghost_id"
    t.string "description"
    t.boolean "typedSearch"
    t.boolean "solo_haunt"
    t.boolean "burial_ground"
    t.boolean "complexSearch"
    t.index ["ghost_id"], name: "index_searches_on_ghost_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "houses", "ghosts", column: "medium_id"
end
