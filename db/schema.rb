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

ActiveRecord::Schema.define(version: 2020_09_26_124637) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "category_id"
    t.index ["category_id"], name: "index_courses_on_category_id"
  end

  create_table "courses_training_modules", id: false, force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "training_module_id", null: false
    t.index "\"courses\"", name: "index_courses_training_modules_on_courses"
    t.index "\"training_modules\"", name: "index_courses_training_modules_on_training_modules"
    t.index ["course_id", "training_module_id"], name: "courses_training_modules_composite", unique: true
  end

  create_table "training_module_activities", force: :cascade do |t|
    t.string "activity_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "training_modules", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "difficulty"
    t.integer "kind"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
