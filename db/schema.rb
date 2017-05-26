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

ActiveRecord::Schema.define(version: 20170525210354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doors", force: :cascade do |t|
    t.integer  "x"
    t.integer  "y"
    t.integer  "board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_doors_on_board_id", using: :btree
  end

  create_table "keys", force: :cascade do |t|
    t.integer  "x"
    t.integer  "y"
    t.boolean  "available",  default: false
    t.integer  "board_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["board_id"], name: "index_keys_on_board_id", using: :btree
  end

  create_table "monsters", force: :cascade do |t|
    t.integer  "x"
    t.integer  "y"
    t.integer  "board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_monsters_on_board_id", using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.integer  "x"
    t.integer  "y"
    t.boolean  "key",        default: false
    t.integer  "hearts"
    t.integer  "board_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["board_id"], name: "index_players_on_board_id", using: :btree
  end

  add_foreign_key "doors", "boards"
  add_foreign_key "keys", "boards"
  add_foreign_key "monsters", "boards"
  add_foreign_key "players", "boards"
end
