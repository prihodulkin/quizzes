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

ActiveRecord::Schema.define(version: 2020_12_06_083349) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "passed_questions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "question_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "success", default: false
    t.index ["question_id"], name: "index_passed_questions_on_question_id"
    t.index ["user_id"], name: "index_passed_questions_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "test", default: false, null: false
    t.text "text", default: ""
    t.string "answer", default: ""
    t.string "picture", default: ""
    t.bigint "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_questions_on_category_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "quiz_questions", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "quiz_id"
    t.integer "position", default: 0, null: false
    t.datetime "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_quiz_questions_on_question_id"
    t.index ["quiz_id"], name: "index_quiz_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "start"
  end

  create_table "test_answers", force: :cascade do |t|
    t.bigint "question_id"
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_test_answers_on_question_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "surname", default: "", null: false
    t.string "phone", default: "", null: false
    t.string "password_digest"
    t.integer "right_answers", default: 0
    t.integer "total_answers", default: 0
    t.integer "passed_quizes", default: 0
    t.integer "won_quizes", default: 0
    t.integer "position", default: 0
    t.integer "rating", default: 0
    t.string "avatar", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
