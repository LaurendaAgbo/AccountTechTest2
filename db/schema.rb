# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_30_161324) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adresses", force: :cascade do |t|
    t.string "district_name"
    t.string "canton_name"
    t.string "commune_name"
    t.string "locality_name"
    t.string "rue_name"
    t.string "postal_code", default: "?"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cantons", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "district_code", default: "?"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "cantons_on_code_2", unique: true
    t.index ["code"], name: "index_cantons_on_code", unique: true
  end

  create_table "code_pts_chsses", force: :cascade do |t|
    t.string "type_rue"
    t.string "numero_rue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "communes", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "name_upcase"
    t.string "canton_code", default: "?"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_communes_on_code", unique: true
  end

  create_table "districts", force: :cascade do |t|
    t.string "code", default: "?"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_districts_on_code", unique: true
  end

  create_table "localities", force: :cascade do |t|
    t.string "number"
    t.string "name"
    t.string "name_upcase"
    t.integer "code"
    t.string "indic_ville"
    t.date "date_fin_valid"
    t.string "canton_code", default: "?"
    t.string "commune_code", default: "?"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_localities_on_number", unique: true
  end

  create_table "rues", force: :cascade do |t|
    t.integer "number"
    t.string "name"
    t.string "name_upcase"
    t.string "mot_tri"
    t.integer "nomenclature_code"
    t.string "indic_lieu_dit"
    t.date "date_fin_valid"
    t.string "cptch_type_rue", default: "?"
    t.string "cptch_numero_rue", default: "?"
    t.string "locality_number", default: "?"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cantons", "districts", column: "district_code", primary_key: "code"
  add_foreign_key "communes", "cantons", column: "canton_code", primary_key: "code"
  add_foreign_key "localities", "cantons", column: "canton_code", primary_key: "code"
  add_foreign_key "localities", "communes", column: "commune_code", primary_key: "code"
  add_foreign_key "rues", "localities", column: "locality_number", primary_key: "number"
end
