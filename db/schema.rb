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

ActiveRecord::Schema.define(version: 20140113092327) do

  create_table "admins", force: true do |t|
    t.string   "name",            limit: 512, null: false
    t.string   "email",                       null: false
    t.string   "password_digest", limit: 256, null: false
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["id"], name: "index_admins_on_id", unique: true, using: :btree
  add_index "admins", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  create_table "answer_choices", force: true do |t|
    t.string   "text",        limit: 512,                 null: false
    t.boolean  "status",                  default: false, null: false
    t.integer  "question_id",                             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answer_choices", ["id"], name: "index_answer_choices_on_id", unique: true, using: :btree
  add_index "answer_choices", ["question_id"], name: "index_answer_choices_on_question_id_and_created_at", using: :btree

  create_table "answer_texts", force: true do |t|
    t.string   "text",        limit: 512, null: false
    t.integer  "question_id",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answer_texts", ["id"], name: "index_answer_texts_on_id", unique: true, using: :btree
  add_index "answer_texts", ["question_id"], name: "index_answer_texts_on_question_id_and_created_at", using: :btree

  create_table "exam_questions", force: true do |t|
    t.integer  "exam_id",     null: false
    t.integer  "question_id", null: false
    t.integer  "subject_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exam_questions", ["exam_id"], name: "index_exam_questions_on_exam_id_and_created_at", using: :btree
  add_index "exam_questions", ["id"], name: "index_exam_questions_on_id", unique: true, using: :btree
  add_index "exam_questions", ["question_id"], name: "index_questions_on_question_id_and_created_at", using: :btree
  add_index "exam_questions", ["subject_id"], name: "index_exam_questions_on_subject_id_and_created_at", using: :btree

  create_table "exams", force: true do |t|
    t.string   "name",       limit: 512, null: false
    t.integer  "subject_id",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exams", ["id"], name: "index_exams_on_id", unique: true, using: :btree
  add_index "exams", ["subject_id"], name: "index_exams_on_subject_id_and_created_at", using: :btree

  create_table "questions", force: true do |t|
    t.string   "question_text", limit: 512, null: false
    t.boolean  "question_type",             null: false
    t.integer  "subject_id",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["id"], name: "index_questions_on_id", unique: true, using: :btree
  add_index "questions", ["subject_id"], name: "index_questions_on_subjects_id_and_created_at", using: :btree

  create_table "results", force: true do |t|
    t.integer  "mark",       null: false
    t.integer  "user_id",    null: false
    t.integer  "exam_id",    null: false
    t.integer  "subject_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "results", ["exam_id"], name: "index_results_on_exam_id_and_created_at", using: :btree
  add_index "results", ["id"], name: "index_results_on_id", unique: true, using: :btree
  add_index "results", ["subject_id"], name: "index_results_on_subject_id_and_created_at", using: :btree
  add_index "results", ["user_id"], name: "index_results_on_user_id_and_created_at", using: :btree

  create_table "subjects", force: true do |t|
    t.string   "name",       limit: 512, null: false
    t.time     "time",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subjects", ["id"], name: "index_subjects_on_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "name",            limit: 512, null: false
    t.string   "email",                       null: false
    t.string   "password_digest", limit: 256, null: false
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["id"], name: "index_users_on_id", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
