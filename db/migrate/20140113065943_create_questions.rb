class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string   "question_text",         limit: 512,                null: false
      t.boolean  "question_type",                 null: false
      t.integer  "subject_id",                          null: false
      t.timestamps
    end
    add_index "questions", ["id"], unique: true
    add_index "questions", ["subject_id"], name: "index_questions_on_subjects_id_and_created_at"
  end
end