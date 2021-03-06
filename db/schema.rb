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

ActiveRecord::Schema.define(version: 2021_07_15_192628) do

  create_table "barre_class_exercises", force: :cascade do |t|
    t.integer "exercise_id"
    t.integer "barre_class_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "barre_classes", force: :cascade do |t|
    t.string "location"
    t.integer "class_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "equipment_items", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "equipment_items_exercises", id: false, force: :cascade do |t|
    t.integer "exercise_id"
    t.integer "equipment_item_id"
    t.index ["equipment_item_id"], name: "index_equipment_items_exercises_on_equipment_item_id"
    t.index ["exercise_id"], name: "index_equipment_items_exercises_on_exercise_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.integer "quarter"
    t.integer "year"
    t.integer "class_type"
    t.integer "rotation"
    t.integer "section"
    t.integer "location"
    t.integer "direction"
    t.integer "height"
    t.boolean "pull_off", default: false
    t.boolean "two_sided", default: false
    t.boolean "active", default: true
    t.text "choreography"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
